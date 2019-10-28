# vasp_WAVECAR_parity

## Formulism

Wavefunction for a specific kpoints is

\psi_k(r) = ( 1/ sqrt(V) ) * sum_{n,j} ( exp( i * (k+G_{n,j}) \dot r) ).

Assumed inversion centre is IC, then 

r2 = 2*IC - r1 

and the parity is

p(k) = \psi_k(r1) / \psi_k(r2).

I take average ratio of 5 points to avoid accident situation. All points are chosen randomly.


## Usage:

It already has a precompiled excutable program "parity.x", or you may compile by

> ifort -o parity.x wavetrans.f90 parity.f90 main.f90 -assume byterecl

and running by
> /dir/to/program/parity.x

## Using 2D version

- The 2d version control by parameter '-d2', running

> /dir/to/program/parity.x -d2

- I assumed your system lay on AB plane which means your POSCAR looks like

A(1) A(2) 0

B(1) B(2) 0

0    0    C
- carefully choose Inversion centre. I sugguest you put your inversion centre EXACTLY at (000).

## warning:
- Now this code is not tested in magnetic system yet!
- Setting LWAVE=.TRUE. in your INCAR and remaining WAVECAR.
- Target k point included in your KPIONTS
- Your system DOSE have Inversion Symmetry.
- Exact Inverstion Symmetry Coordinate corresponding to POSCAR.
- You need rm GCOEFF.txt after redo vasp calculation.

## tips
- You may run a non-scf calculation which has few kpoints ( target K included of course!) after scf calculation.
- About INVERSION SYMMETRY, usually it's not locate in (0,0,0). So you should carefully check it's coordinate according to POSCAR or you'll get wrong result.
- For the case considering soc, if the system has time reversal symmetry then each band is doubly degenerate and only one need to take into count. 

## example
Example directory contains Bi2Se3 self-consistence field calculation, w/o soc calculation. You just need cd to std/soc dir, and excute parity.x. Reading hint in the screen carefully and it's easy to follow.
1. contain soc or not? y/n
2. target k point. in reciprocal lattice(direct coordinate).  ---> 0 0 0
3. Inversion centre. (for bi2se3 it's 0 0 0) ---> 0 0 0
then all parity will be calculate.


## Reference
WAVETRANS.F90 code modified from https://www.andrew.cmu.edu/user/feenstra/wavetrans/  by R. M. Feenstra and M. Widom Department of Physics, Carnegie Mellon University, Pittsburgh, PA 15213

## other
- soc: spin-orbit coupling
