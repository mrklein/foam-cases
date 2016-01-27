#include "fvCFD.H"

#include "uniformSet.H"
#include "meshSearch.H"
#include "cellSet.H"

#include "constants.H"

using Foam::constant::mathematical::pi;

int main(int argc, char *argv[])
{
    // Standard solver includes
    #include "setRootCase.H"
    #include "createTime.H"
    #include "createMesh.H"

    // Create field
    volScalarField f
    (
        IOobject
        (
            "f",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        mesh,
        dimensionedScalar("f", dimMass, 1.0)
    );

    // Preset field
    forAll(f.internalField(), i)
    {
        scalar x = mesh.C()[i].x();

        f.internalField()[i] = x;
    }
    // Initial write of the field
    f.write();

    // Create a line for integration (see documentation for uniformSet)
    uniformSet line
    (
        "my_lovely_line",  // arbitrary name
        mesh,  // mesh object
        meshSearch(mesh),  // mesh search engine
        "distance",  // so called axis, in this case it is distance from the start
        point(0, 0.05, 0.005),  // start point
        point(0.1, 0.05, 0.005),  // end point
        100  // density of points on the line
    );

    cellSet lineCells
    (
        mesh,
        "my_lovely_line_cells",
        labelHashSet(line.cells())
    );
    lineCells.write();

    while (runTime.loop())
    {
        scalar r = 0.0;
        // Iterating through the cell labels of our line
        for(int i = 1; i < line.cells().size(); i++)
        {
            // Cells labels
            label idx1 = line.cells()[i - 1];
            label idx2 = line.cells()[i];

            // Values in adjacent cells
            scalar v1 = f.internalField()[idx1];
            scalar v2 = f.internalField()[idx2];
            
            // Distance between cells
            scalar d = mag(mesh.C()[idx2] - mesh.C()[idx1]);

            // "Trapezoidal rule"
            r += 0.5*(v1 + v2)*d;
        }

        Info<< r << endl;
    }
}
