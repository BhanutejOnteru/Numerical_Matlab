%clear the command window
clc;
%closes all files
close all

fileID=fopen('hard_test.txt','r');

formatSpec='%f';
% getting the size of the file
size_array = [1 inf];


read_file= fscanf(fileID,formatSpec,size_array);

% A*x=b

% size of the matrix
size_matrix=read_file(1);

% matrix A
matrix_a=zeros([size_matrix size_matrix]);

% constant vector
constant_b=zeros([size_matrix 1]);

%Calling my function Cramer
Cramer(matrix_a,constant_b,size_matrix,read_file);

% I have to get the first column in matrix from the b vector
% Then divide that the original matrix

function Cramer(A,b,size_matrix,read_file)
    k=2;
    %iterating through the matrix and filling it up with A matrix
    for i=1:size_matrix
        for j=1:size_matrix
            temp=read_file(k);
            A(i,j)=temp;
            k = k+1;
        end
    end
    
    % filling up the b vector!
    for i=1:size_matrix
        temp=read_file(k);
        k = k+1;
        b(i,1)=temp;
    end
    if det(A)==0
        fprintf('The system does not have unique solution');
    end
    fprintf('determinant A=%f\n',det(A));
    x_answer=[];
    %using cramer's algorithm in this loop to find answer's dynamically
    for i = 1:length(A)  
    
    % assigning it to a temp
    temp = A;
  
    temp(1:end,i) = b;

    determinant_A = det(temp);
    
    answer=det(temp)/det(A);
    x_answer=[x_answer,answer];
    fprintf('determinant A%d = %f\n',i,determinant_A); 
end
     for i=1:length(x_answer)
          fprintf('x%d= %f\n',i,x_answer(i));
     end
        
end
