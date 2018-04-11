X = randi([0,9],19,10);
[U,S,V] = svd(X);

 A = randi([0,9],19,4);
B = randi([0,9],10,4);
Ab = A*transpose(B);
Xfinal = X + Ab;

[p,q] = size(X);
c = size(A,2);

temp11 = eye(19) - (U*transpose(U));
temp12 = temp11*A;
P = orth(temp12);
Ra = transpose(P)*temp11;
Ra = Ra*A;

temp21 = eye(10) - (V*transpose(V));
temp22 = temp21*B;
Q = orth(temp22);
Rb = transpose(Q)*temp21;
Rb = Rb*B;

temp31 = transpose(U)*A;
temp32 = transpose(V)*B;


temp41 = S;
temp41(p+c,q+c) = 0;

    
temp51 = [temp31;Ra];
temp52 = [temp32;Rb];
temp53 = transpose(temp52);
temp54 = temp51*temp53;

K = temp41 + temp54;

[Uf,Sf,Vf] = svd(K);










