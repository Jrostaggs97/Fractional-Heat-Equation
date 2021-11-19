%Comparision of different values for the fractional heat equation using the
%fourier transform

%parameters and domain descritization 
s = 128; %spatial descritization 
L = 40; %domain length
x_space = linspace(-L,L,s+1); %periodic bc so add one
x_span = x_space(1:s); %now cut the end off

delta_t = .1; %time descritizatoin
t_end = 5; %end time
t_span = 0:delta_t:t_end; %time domain

D = 3; %diffusion coefficent

%initial condition
u_0 = (20/pi).*exp(-20.*((x_span).^2));


%take u_0 into frequency space
u_0_hat = reshape(fft(u_0),s,1);

%wave numbers for Fourier Space
lambda = reshape((2*pi/L)*[0:(s/2 -1) (-s/2):-1],s,1); % rescale to periodic domain 

%integrate in time with ode45 - output will be in freq domain 

plot(x_span,u_0)
hold on;
ylim([0,2])
for j = 1:5
    
    a = 1+j/10; %fractional diffusion/derivative value
    [time,u_hat_approx_frac_heat] = ode45(@(t,u_0_hat) fractional_heat_func(t,u_0_hat,D,lambda,a),t_span,u_0_hat);
    
    u_plot_frac_heat = reshape(real(ifft(u_hat_approx_frac_heat(length(time),:))),1,s);
    
    plot(x_span,u_plot_frac_heat)
    
    %things close to two decay off faster
end 
legend


