function[] = discussion7pt2()

xx = normrnd(1,1,1,1000);
yy = normrnd(3,1,1,1000);
zz = normrnd(2,0.5,1,1000);

input = -2:0.1:6;
normalpdf = @(x,mu,sigma) 1/sqrt(2*pi*sigma^2)*exp(-((x-mu).^2)./(2*sigma^2));

close all

figure
subplot(3,3,1)
histogram(xx,'Normalization','pdf')
hold on
plot(input,normalpdf(input,1,1),'LineWidth',2)
title('Mean 1, Standard Deviation 1')
hold off

subplot(3,3,2)
histogram(yy,'Normalization','pdf')
hold on
plot(input,normalpdf(input,3,1),'-r','LineWidth',2)
title('Mean 3, Standard Deviation 1')
hold off

subplot(3,3,3)
histogram(zz,'Normalization','pdf')
hold on
plot(input,normalpdf(input,2,0.5),'-r','LineWidth',2)
title('Mean 2, Standard Deviation 0.5')
hold off

subplot(3,3,4)
histogram(xx,'Normalization','pdf')
hold on
histogram(yy,'Normalization','pdf')
title('xx and yy together')
hold off

subplot(3,3,5)
histogram(xx,'Normalization','pdf')
hold on
histogram(yy,'Normalization','pdf')
histogram(zz,'Normalization','pdf')
title('All together')
hold off

subplot(3,3,6)
xxnew = xx + 2;
histogram(xxnew,'Normalization','pdf')
hold on
histogram(yy,'Normalization','pdf')
title('xx and yy together')
hold off

subplot(3,3,7)
xxnew1 = xx*0.5;
histogram(xxnew1,'Normalization','pdf')
hold on
histogram(xxnew1,'Normalization','pdf')
histogram(zz,'Normalization','pdf')
title('Standard deviation of xx shifted')
hold off

subplot(3,3,8)
zz1 = zz - 2;
histogram(zz1,'Normalization','pdf')
title('zz shifted to origin')

subplot(3,3,9)
zz2 = zz1/0.5;
histogram(zz2,'Normalization','pdf')
hold on
input=-4:0.1:4;
plot(input,normalpdf(input,0,1),'LineWidth',2)
title('zz shifted to origin with sigma = 1');