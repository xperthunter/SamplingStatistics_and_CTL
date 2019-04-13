function[] = binomial_sampling(N,p,M)
% BIM 105 DISCUSSION 6
% AUTHOR: KEITH FRAGA
% FALL 2017

% === Sampling from different probability distributions === %

% THE BINOMIAL RANDOM VARIABLE %

% Now that we understand the Bernoulli distribution, we can sample the Binomial.  

% Remember the Binomial counts the number of successes out of N Bernoulli
%   trials. The parameters are N and p.

% The parameter p is a number between 0 and 1. So if we generate a uniform
%  random number between 0 and 1, and it is less than p, then simulated 
%  a Bernoulli success. Lets build upon what we did for sample of a Bernoulli
%  with success probability p. 

sample = rand(1,N);
sample = sample <= p;

% Now we have our N Bernoulli trials. To get the Binomial, we just take the
% sum of the Bernoulli trials. 

Binomial_sample = sum(sample);
fprintf('Our Bernoulli trials were:\n')
disp(sample);
fprintf('Our Binomial sample from N Bernoulli trials is: %.d\n\n', Binomial_sample);
% % 
% % % Now lets generate many Binomial samples. 
% % 
sample = rand(M,N);
% We are getting M samples here, each row is its own sample. 

sample = sample <= p;

% Now lets make our M Binomial samples. 
sample = sum(sample,2);
% We want to sum along the row. This results in a column vector with M
% rows.

avg = mean(sample); 
var = (std(sample))^2;

fprintf('=== Average of our M Binomial samples is %.4f and variance is %.4f ===\n',avg, var);
% 
% % 
% % % Right now, all we have is M Binomial samples. But imagine we want to
% % % resample our Binomial random variable many times, in other words we want
% % % many collections of M Binomial samples. 
% % 
% % % In Matlab, matrices don't have to be just 2-dimensional. You can create a
% % % stack of matrices on top each other. 
% % 
% % % Say we want 100 re-samples, each of size M. Then we make a M by N matrix,
% % % as we did before, but with a hundred stacks. In Matlab this comes out to:
% % 
% % resamples = zeros(M,N,100);
% % % This is a stack, with 100 MxN matrices on top of each other, with zeros at each entry. 
% % 
% % % Now lets generate our Binomial resamples. 
% % 
resamples = rand(M,N,100);
resamples = resamples <= p;
resamples = sum(resamples,2);

avg_resamples = mean(resamples);
avg_resamples = reshape(avg_resamples,[100,1]);
% We use the command re-shape here to turn our stack back into a column
% vector.

% Now make a histogram of the averages from 100 resampled Binomial variable
hist(avg_resamples)
