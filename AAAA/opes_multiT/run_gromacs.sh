#!/bin/bash

source source_gpu_gromacs.sh


gmx_mpi grompp -f prd.mdp -c md_10ns.gro -n index.ndx -p topol.top -o input.tpr -maxwarn 1

export OMP_NUM_THREADS=2

mpiexec -n 1 gmx_mpi mdrun -s input.tpr -deffnm rna_multiT -plumed plumed_new.dat -nsteps 50000000 -pin on -pinoffset 6 -gpu_id 1



