#include "fvCFD.H"

#include "uniformSet.H"
#include "meshSearch.H"

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
        scalar x = mesh.C()[i].x() - 0.05;
        scalar y = mesh.C()[i].y() - 0.05;

        f.internalField()[i] = std::sin(5*pi*std::sqrt(x*x + y*y))/std::sqrt(x*x + y*y);
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

    while (runTime.loop())
    {
        scalar r = 0.0;
        // Iterating through the cell labels of our line
        for(int i = 1; i < line.cells().size(); i++)
        {
            // Values in adjacent cells
            scalar v1 = f.internalField()[i - 1];
            scalar v2 = f.internalField()[i];
            
            // Distance between cells
            scalar d = mag(mesh.C()[i] - mesh.C()[i - 1]);

            // "Trapezoidal rule"
            r += 0.5*(v1 + v2)*d;
        }

        Info<< r << endl;
    }
}
