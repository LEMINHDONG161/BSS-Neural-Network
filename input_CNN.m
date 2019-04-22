function [B]=input_CNN(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION
% B=2D_CNN(A)
%tranform input (2048x1  N column feature) data into 2D (64x32)

k=1;
B=[];
start=0;
stop=0;
    for i=1:64
        start=32*(k-1) +1;
        stop =32*k;
    B(i,:)=A(1,start:stop);
    k=k+1;
    end
    
    
    

   