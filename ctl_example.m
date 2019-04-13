function[] = ctl_example(nn,N,p,NN,pp,M)

% Something strange occurs when we take many samples of a distribution.
% 
% Consider sampling from the uniform, Bernoulli, and Binomial distibutions.
% Plot a histogram of the sample means when you take many samples of each
% of these distributions. 
% 
% We will take re-sample sizes of 10, 100, 1000, and 10,000. 

% === VARIALBES === %
%nn = number uniform random numbers to take for each re-samples
%N = number bernoulli trials for each re-samples
%p = success prob for bernoulli
%NN = number of bernoulli trials for Binomial
%pp = success prob for Binomial
%M = number of binomial random numbers to take for each re-sample

% === THE UNIFORM CASE === %

% sample1 = rand(10,nn);
% % We want 10 re-samples, each with nn randon numbers. 
% 
% u1 = mean(sample1,2);
% 
% % We want the mean calculated along the row of our sample1 matrix. 
% % u2 is now a column vector of N rows
% 
% sample2 = rand(100,nn);
% u2 = mean(sample2,2);
% 
% sample3 = rand(1000,nn);
% u3 = mean(sample3,2);
% 
% sample4 = rand(10000,nn);
% u4 = mean(sample4,2);
% 
% % Lets make 4 histograms, one each for the mean vectors, but I want it in a
% % single figure window. 
% close all
% figure
% subplot(2,2,1)
% hist(u1)
% title('Sample Size 10 - Unif')
% 
% subplot(2,2,2)
% hist(u2)
% title('Sample Size 100 - Unif')
% 
% subplot(2,2,3)
% hist(u3)
% title('Sample Size 1000 - Unif')
% 
% subplot(2,2,4)
% hist(u4)
% title('Sample Size 10,000 - Unif')
% 
% % === THE BERNOULLI CASE === %
% 
% sample1 = rand(10,N);
% % We are getting 10 samples here, each of size N. 
% 
% % Get the Bernoulli outcomes
% sample1 = sample1 <= p;
% 
% % Compute the average for each trial
% avg1 = mean(sample1,2);
% 
% sample2 = rand(100,N);
% sample2 = sample2 <= p;
% avg2 = mean(sample2,2);
% 
% sample3 = rand(1000,N);
% sample3 = sample3 <= p;
% avg3 = mean(sample3,2);
% 
% sample4 = rand(10000,N);
% sample4 = sample4 <= p;
% avg4 = mean(sample4,2);
% 
% figure
% subplot(2,2,1)
% hist(avg1)
% title('Sample Size 10 - Bern')
% 
% subplot(2,2,2)
% hist(avg2)
% title('Sample Size 100 - Bern')
% 
% subplot(2,2,3)
% hist(avg3)
% title('Sample Size 1000 - Bern')
% 
% subplot(2,2,4)
% hist(avg4)
% title('Sample Size 10,000 - Bern')
% 
% % === THE BINOMIAL CASE === %
% 
% resamples1 = rand(M,NN,10);
% % Generate the NN bernoulli trials for the M binomial random numbers. Do
% % this 10 times. 
% 
% resamples1 = resamples1 <= pp;
% % Collect the bernoulli successes. 
% 
% resamples1 = sum(resamples1,2);
% % Generate the Binomial random numbers for the M samples, 10 times
% 
% avg1 = mean(resamples1);
% % Compute the mean of those M trials
% avg1 = reshape(avg1,[10,1]);
% % Re-shape into a column vector.
% 
% resamples2 = rand(M,NN,100);
% resamples2 = resamples2 <= pp;
% resamples2 = sum(resamples2,2);
% avg2 = mean(resamples2);
% avg2 = reshape(avg2,[100,1]);
% 
% resamples3 = rand(M,NN,1000);
% resamples3 = resamples3 <= pp;
% resamples3 = sum(resamples3,2);
% avg3 = mean(resamples3);
% avg3 = reshape(avg3,[1000,1]);
% 
% resamples4 = rand(M,NN,10000);
% resamples4 = resamples4 <= pp;
% resamples4 = sum(resamples4,2);
% avg4 = mean(resamples4);
% avg4 = reshape(avg4,[10000,1]);
% 
% % Now lets plot their histograms %
% 
% figure
% subplot(2,2,1)
% hist(avg1)
% title('Sample Size 10 - Binom')
% 
% subplot(2,2,2)
% hist(avg2)
% title('Sample Size 100 - Binom')
% 
% subplot(2,2,3)
% hist(avg3)
% title('Sample Size 1000 - Binom')
% 
% subplot(2,2,4)
% hist(avg4)
% title('Sample Size 10,000 - Binom')