function[success] = bernoulli_sampling(N,p)
% BIM 105 DISCUSSION 6
% AUTHOR: KEITH FRAGA
% FALL 2017

% === Sampling from different probability distributions === %

% THE BERNOULLI RANDOM VARIABLE %

% Now that we understand the uniform distribution, we can apply uniform
%  random numbers to study our favorite discrete random variables. 
%  Lets start with the Bernoulli. 

% Remember the Bernoulli is the outcome of a random event with two
%  mutually exclusive outcomes. The parameter for the Bernoulli is the
%  success probability p.

% The parameter p is a number between 0 and 1. So if we generate a uniform
%  random number between 0 and 1, and it is less than p, then simulated 
%  a Bernoulli success. Lets try this in Matlab. 

% Let tt be a generate random number. Let p = 0.5 for now. 
% % START
tt = rand(1,1);

if tt <= p
    success = 1;
else
    success = 0;
end
% % % % 
% % % % % Now run this script in the command window. Save it. Then type in your
% % % % %   command window bernoulli_sampling(1,0.5). Ignore the 1 for now.  
% % % % 
% % % % % The output of this script is the variable success, and it is either 1 or zero. 
% % % % 
% % % % % Try it with other success probabilities p. 
% % % % 
% % % % % We know that the mean of a Bernoulli is p and variance is p(1-p). Lets show
% % % % %   this with a numerical simulation. At the top line of script we have two
% % % % %   inputs, N and p. Lets make p = 0.4, and N is the size of our sample
% % % % %   made of the N Bernoulli trials. 
% % % % 
% % % % % Using a for loop we can generate our sample. We want to save our
% % % % %   Bernoulli sample in a vector. Call it sample. And this will be a row
% % % % %   vector of dimensions 1,n. We want initialize sample with all zeros, and
% % % % %   fill it in as we go. 
% % % % 
sample = zeros(1,N);

for ii = 1:N
   tt = rand(1,1);
   if tt <= p 
       sample(1,ii) = 1;
   end
    % If not, then that cell is zero, but it already is zero
end

% Lets now compute the mean of sample and the variance. 

avg = mean(sample);
var = (std(sample))^2;

fprintf('Average of our N Bernoulli trials is %.4f and variance is %.4f\n',avg, var);
% % % % 
% % % % % Now lets run the code. Run it by writing in your command window,
% % % % % bernoulli_sampling(10,0.4). What do you get? What should mean be? What
% % % % % should variance be? Try larger sample sizes. 
% % % % 
% % % % % === Lets make this code better! === %
% % % % 
% % % % % If you know a little Matlab, then you might know that Matlab has a hard
% % % % % time with for loops. Matlab does stand for matrix laboratory, so lets try
% % % % % and work with matrices. 
% % % % 
% % % % % Lets make a new sample vector, but instead of initializing sample with
% % % % % zeros, lets just make our sample is two lines of code. 
% % % % 
% % % % % Create a random vector of length N. 
sample = rand(1, N);

% If any element in sample is less than p, then it was a success, making
% that cell a 1, and if its greater than p, then it is a failure and it is
% a zero. This is easy to do in Matlab. 

sample = sample <= p;

% Line 87 makes sample a logical vector now, where the entries are simply
% zeros and 1s. We can now just take mean and variance of sample. 

avg = mean(sample);
var = (std(sample))^2;

fprintf('Better Way: Average of our N Bernoulli trials is %.4f and variance is %.4f\n',avg, var);
% % % % 
% % % % % We can even do one better! Instead of generating one sample, lets
% % % % % generate many samples. 
% % % % 
sample = rand(10,N);
% We are getting 10 samples here, each row is its own sample. 
sample = sample <= p;

avg = mean(sample,2);
% The 2 here is super important. Without it, mean() would calculate the
% average down the column, not by row. We want by row. 

var = (std(sample,0,2)).^2;
% The command for std here is a little complicated. The 0 is for the
% normalization scheme, (divide by N or N-1), and 2 is the dimension we are
% computing the standard deviation along. 

% What is important is the .^2 at the end of line 109. The period says
% square each element of the matrix. If you just did ^2 it would think you
% want matrix multiplication and we don't want that. 

summary_table = [avg,var];
fprintf('\n ===\n ===\nSummary table of our 10 Bernoulli samples of size N\n');
fprintf('Average:::Variance\n');

disp(summary_table);