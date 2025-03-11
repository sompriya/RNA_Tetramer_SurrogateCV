#!/bin/bash

source source_gpu_gromacs.sh


gmx_mpi grompp -f prd.mdp -c md_10ns.gro -n index.ndx -p topol.top -o input.tpr -maxwarn 1

export OMP_NUM_THREADS=2

mpiexec -n 1 gmx_mpi mdrun -s input.tpr -deffnm rna_multiT_1 -plumed plumed.dat -nsteps 500000000 -pin on -pinoffset 24 -gpu_id 0



