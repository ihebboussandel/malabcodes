clear all 
clc
f=tf([2 1],[1 2 1])
f2 = zpk([-1/2],[-1 -1],2);
subplot(2,3,1);
step(f);
subplot(2,3,2);
impulse(f);
subplot(2,3,3);
bode(f);
subplot(2,3,4);
nyquist(f);
subplot(2,3,5);
nichols(f);
