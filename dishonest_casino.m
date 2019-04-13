function[] = dishonest_casino(fair,number_of_rolls)

if fair == 0
    p6 = 1/6;
else
    p6 = 1/2;
end

data_fair = 1;
data_uf = 1;

fair_data = 0;
tracker = 0;
while tracker < number_of_rolls
    roll = rand(1,1);
    tracker = tracker + 1;
    if roll <= p6
        data_fair = data_fair*(1/6);
        data_uf = data_uf*(1/2);
    else
        data_fair = data_fair*(5/6);
        data_uf = data_uf*(1/2);
    end
    
    fair_data = data_fair*(0.99)/(data_fair + data_uf);
    unfair_data = 1 - fair_data;
    
    fprintf('Roll number:%d\n', tracker);
    fprintf('\tFair given data: %.4f\n',fair_data);
    fprintf('\tUnfair given data: %.4f\n',unfair_data);
end 