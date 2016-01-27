Code snippet and test case to illustrate uniformSet functionality.

## Usage

1. Run `wmake` in integral folder, as a result `integral` executable is created
   in the folder.
2. Go to `test` folder.
3. Run `blockMesh`.
4. Run `integral`.

## Example output

```
$ ./integral 
/*---------------------------------------------------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2.4.0                                 |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
Build  : 2.4.0-dcea1e13ff76
Exec   : ./integral
Date   : Jan 27 2016
Time   : 10:41:34
Host   : "baloo054.ijl.nancy-universite.fr"
PID    : 4076
Case   : /scratch/matveich1/Projects/test/foam-cases/integral/test
nProcs : 1
sigFpe : Enabling floating point exception trapping (FOAM_SIGFPE).
fileModificationChecking : Monitoring run-time modified files using timeStampMaster
allowSystemOperations : Allowing user-supplied system call operations

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
Create time

Create mesh for time = 0

0.00475
```

