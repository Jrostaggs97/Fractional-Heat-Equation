function [u_hat_approx] = fractional_heat_func(t,u_0_hat,D,lambda,a)


%"symmetric heat - if you want a mix of diffusion and traveling wave
%(direction of wave depends on if you get rid of i or -i)
frac_heat_hat = D*(((-1i*lambda).^(a))+((1i*lambda).^(a))).*u_0_hat;

u_hat_approx = frac_heat_hat;

end