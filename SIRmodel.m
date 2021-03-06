%%% SIR Model Code 7.12.2020
%%% AQ Group

% %% Data
% filename = "saopaulo_full.csv"; % filename for data
% data_table = readtable(filename);
% NPI_data = data_table.NPI'; % create row vector of NPI data
% AQ_data = data_table.Mean_PM25'; % create row vector of AQ data
% 
% % Then we create some sort of function of these that relates them to impact
% % on beta over time.

%% Constants
N = 100;   % size of population
b_NPI = 1; % parameter of beta influenced by NPI
b_AQ = 1;  % parameter of beta influenced by air quality
beta = b_NPI*b_AQ/N; % rate of traveling from S to I, dependent on b_NPI and
                     % b_AQ
% beta_vec = b_NPI.*b_AQ./N; % pairwise multiplication if b_NPI, b_AQ are
                      % timeseries
gamma = 0.1; % rate of traveling from I to R

% Integration parameters
dt = 0.01;     % timestep; can't be much bigger than 0.01 for soln to be stable
t_end = 110;  % number of days
time = 0:dt:110; % create time vector of values 0 to t_end of interval dt
S = zeros(1, length(time)); % empty S vector of length t; will store the number
                      % of susceptibles at each timestep after integration
I = zeros(1, length(time)); % empty I vector
R = zeros(1, length(time)); % empty R vector
S(1) = N-1;   % initial condition of S
I(1) = 1;     % IC of I
R(1) = 0;     % IC of R

%% 4th Order Runge Kutta Integration
for t = 1:length(time) - 1 % set up for-loop
    
   % if we're using a timeseries for beta_NPI and beta_AQ
   % (ceil will round up to the nearest integer, so that at time t = 0.01,
   % data from day 1 will be used.
   % beta = beta_vec(ceil(t*dt));
   
   Sk1 = dt*dSdt(beta, S(t), I(t)); 
   Ik1 = dt*dIdt(beta, S(t), I(t), gamma);
   Rk1 = dt*dRdt(gamma, I(t));
   
   Sk2 = dt*dSdt(beta, S(t) + Sk1/2, I(t) + Ik1/2);
   Ik2 = dt*dIdt(beta, S(t) + Sk1/2, I(t) + Ik1/2, gamma);
   Rk2 = dt*dRdt(gamma, I(t) + Ik1/2);
   
   Sk3 = dt*dSdt(beta, S(t) + Sk2/2, I(t) + Ik2/2);
   Ik3 = dt*dIdt(beta, S(t) + Sk2/2, I(t) + Ik2/2, gamma);
   Rk3 = dt*dRdt(gamma, I(t) + Ik2/2);
   
   Sk4 = dt*dSdt(beta, S(t) + Sk3, I(t) + Ik3);
   Ik4 = dt*dIdt(beta, S(t) + Sk3, I(t) + Ik3, gamma);
   Rk4 = dt*dRdt(gamma, I(t) + Ik3);

   S(t + 1) = S(t) + (1/6)*(Sk1 + 2*Sk2 + 2*Sk3 + Sk4);
   I(t + 1) = I(t) + (1/6)*(Ik1 + 2*Ik2 + 2*Ik3 + Ik4);
   R(t + 1) = R(t) + (1/6)*(Rk1 + 2*Rk2 + 2*Rk3 + Rk4);
   
end

%% Plots
figure(1)
hold on;
plot(time, S, 'k', 'linewidth', 2);
plot(time, I, 'r', 'linewidth', 2);
plot(time, R, 'b', 'linewidth', 2);
legend('Susceptible', 'Infected', 'Recovered');
xlabel('time (days)');
ylabel('number of individuals');

%% Functions
% dS/dt = -beta*S*I
function dS = dSdt(beta, S, I)
dS = -beta*S*I;
end

% dI/dt = beta*S*I - gamma*I
function dI = dIdt(beta, S, I, gamma)
dI = (beta*S*I) - (gamma*I);
end

% dR/dt = gamma*I
function dR = dRdt(gamma, I)
dR = gamma*I;
end


