function [] = random_sampling(N)
% BIM 105 DISCUSSION 6
% AUTHOR: KEITH FRAGA
% FALL 2017

% === Sampling from different probability distributions === %

% THE UNIFORM DISTRIBUTION %

% A random variable that we have not talked about yet is the 
%  uniform distribution. This is a continuous random variable
%  where the probability of selecting any real number in the 
%  interval [0,1) is equally likely. Uniform random variables
%  are extremely useful. There are many computer algorithms to
%  generate uniformaly distribute random numbers. We will talk
%  about how MatLab does it. 

% The function in Matlab to generate uniform random numbers is
%  rand(). The input for rand() is the dimension of the output
%  matrix. Matlab works in matrices, so keep this in mind for
%  our discussion. 

% Try using the rand() function in the command window. Try the following 
%  commands. 

% PLEASE NOTE: The semicolon (;) is used here to suppress the output. When
%  you run the command in the command window, run it without the semicolon
%  so you see the output. 

fprintf('=== A column vector, random entries ===\n')
xx = rand(3,1);
disp(xx);
% This is a random column vector, 3 rows 1 column. The dimensions of a 
%  matrix, A(m,n), has m rows and n columns.  

fprintf('=== A row vector, random entries ===\n') 
yy = rand(1,3);
disp(yy);
% This is a row vector, 1 row and 3 columns. 

fprintf('=== A 2x2 matrix of random number entries ===\n');
zz = rand(2);
disp(zz);
% This is a square matrix, 2 rows and 2 columns. 


% Now lets explore this random variable. Let X ~ Uniform(0,1). The two
%  parameters of a uniform is your lower limit and your upper limit. 

% Lets generate a sample of 10 observations from X. All we need to do
%  this is xx = rand(10,1) or xx = rand(1,10), doesn't matter. 

xx = rand(10,1);

% The Matlab command, hist() makes a histogram of your data. Do this with 
%  xx. What do you see?

close all;
figure 
hist(xx)
title('Histogram of xx, 10 random numbers');

% Lets make our sample size larger. Try a sample size of 100, 500, 1000,
%  and 10,000. Make histograms of each. 

yy = rand(100,1);
zz = rand(500,1);
ww = rand(1000,1);
tt = rand(10000,1);

figure
subplot(2,2,1)
hist(yy)
title('Histogram of yy, 100 random numbers')

subplot(2,2,2)
hist(zz)
title('Histogram of zz, 500 random numbers')

subplot(2,2,3)
hist(ww);
title('Histogram of ww, 1000 random numbers')

subplot(2,2,4);
hist(tt);
title('Histogram of tt, 10,000 random numbers')

% As the sample size increases, the distribution of random numbers become
%  more and more uniform. 

% Compute the mean and standard deviation of each your samples. In Matlab
%  you can easily compute the mean and standard deviation using the functions
%   mean() and std(), respectively. 

ux = mean(xx);
sdx = std(xx);

uy = mean(yy);
sdy = std(yy);

uz = mean(zz);
sdz = std(zz);

uw = mean(ww);
sdw = std(ww);

ut = mean(tt);
sdt = std(tt);

fprintf('Mean of xx: %f\t Standard deviation of xx:%f\n', ux, sdx);

% You should see that the mean is approaching 0.5 and the standard deviation
%  is approaching ~ 0.29. Lets use the definition of mean and variance to show
%  that is exactly what we expect. 

