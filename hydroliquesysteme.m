clear all;
close all;
A=[-0.332 0.332 0;0.332 -0.0664 0.332; 0 0.332 -0.524];
B=[0.764 0; 0 0 ;0 0.764];
C=[1 0 0;0 0 1];
D=zeros(2);
G = ss(A,B,C,D)%creation de system
pole(G)
uu=eig(A)
C0=ctrb(A,B)
rank(C0)
p=[-1 -1.5 -1.2 ]%%%les valeur du pole est donnee (choix) non multiple
Kc = place(A,B,p)
p=[-1 -1.5 -1.2 ]%%%les valeur du pole est donnee (choix) non multiple
Kc = place(A,B,p)
A1=A-B*Kc