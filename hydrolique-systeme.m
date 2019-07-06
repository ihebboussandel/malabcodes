clear all;
close all;
A=[-0.332 0.332 0;0.332 -0.0664 0.332; 0 0.332 -0.524];
B=[0.764 0; 0 0 ;0 0.764];
C=[1 0 0;0 0 1];
D=0;
Sys = ss(a,b,c,d)%creation de system
