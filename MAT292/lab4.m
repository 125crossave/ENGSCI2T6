%% Systems Lab: Systems of ODEs in MATLAB
%
% In this lab, you will write your own ODE system solver for the Heun method 
% (aka the Improved Euler method), and compare its results to those of |ode45|.
%
% You will also learn how to save images in MATLAB.
% 
% Opening the m-file lab4.m in the MATLAB editor, step through each
% part using cell mode to see the results.  Compare the output with the
% PDF, which was generated from this m-file.
%
% There are four (4) exercises in this lab that are to be handed in on the
% due date of the lab.  Write your solutions in a separate file, including
% appropriate descriptions in each step. Save the m-files and the pdf-file 
% for Exercise 4 and submit them on Quercus.
%
%% Exercise 1
%
% Objective: Write your own ODE system solver using the Heun/Improved Euler 
% Method and compare it to |ode45|.
%
% Details: Consider the system of 2 ODEs:
%
% |x1'=f(t,x1,x2), x2'=g(t,x1,x2)|
%
% This m-file should be a function which accepts as variables 
% (t0,tN,x0,h), where t0 and tN are the start and end points of the 
% interval on which to solve the ODE, h is the stepsize, and x0 is a vector 
% for the initial condition of the system of ODEs |x(t0)=x0|.
% Name the function solvesystem_<UTORid>.m (Substitute your UTORid for <UTORid>).
% You may also want to pass the functions into the ODE the way |ode45| 
% does (check MATLAB labs 2 and 3).
%
% Your m-file should return a row vector of times and a matrix of 
% approximate solution values (the first row has the approximation for |x1|
% and the second row has the approximation for |x2|).
% 
% Note: you will need to use a loop to do this exercise.  
% You will also need to recall the Heun/Improved Euler algorithm learned in lectures.  
%

%% Exercise 2
%
% Objective: Compare Heun with an exact solution
%
% Details:  Consider the system of ODEs
%
% |x1' = x1/2 - 2*x2, x2' = 5*x1 - x2|
%
% with initial condition |x(0)=(1,1)|.
%
% Use your method from Exercise 1 to approximate the solution from |t=0|
% to |t=4*pi| with step size |h=0.05|.
%
% Compute the exact solution (by hand) and plot both phase portraits on 
% the same figure for comparison.
%
% Your submission should show the construction of the inline function, the
% use of your Heun's method to obtain the solution, a construction of the 
% exact solution, and a plot showing both.  In the comments, include the 
% exact solution.

%exact soln: x1exact = exp(-t/4).*((6 / 40)*cos(s*t/4)-(s/20)*sin(s*t/4)+(17/s)*((s/20)*cos(s*t/4)+(6 / 40)*sin(s*t/4)))
% x2exact = exp(-t/4).*(cos(s*t/4)+(17/s)*(sin(s*t/4))); where s = sqrt(151)

% Label your axes and include a legend.

%Eigenvalues are (-1 + sqrt151 i)/4, (-1 - sqrt151 i)/4. Thus, the
%corresponding eigenvectors are (3/20 + (sqrt151)i/20, 1) and (3/20 -
%(sqrt151)i/20, 1) and making use of the fact that e^it = cost + isint we 
% obtain the exact solution of 

%introduce variables to help make code shorter and more readable
clear all; close all; clc;
s = sqrt(151);
%set initial conditions
xinit = 2:1;
xinit(1, 1) = 1;
xinit(2, 1) = 1;
f1 = @(t, x1, x2) (x1 /2) - (2*x2);
f2 = @(t, x1, x2) (5*x1) - x2;
[t,y] = systemsolver_rizzmaster(f1, f2, 0, 4.*pi, xinit, 0.05);
x1_exact = exp(-t/4).*((6 / 40)*cos(s*t/4)-(s/20)*sin(s*t/4)+(17/s)*((s/20)*cos(s*t/4)+(6 / 40)*sin(s*t/4)));
x2_exact = exp(-t/4).*(cos(s*t/4)+(17/s)*(sin(s*t/4)));
plot(y(1,:), y(2,:), 'x--'); hold on;
plot(x1_exact, x2_exact);
title('Results of systemsolver_rizzmaster compared to exact soln for Question 2');
ylabel('x_2'); xlabel('x_1');
legend('systemsolver_rizzmaster', 'exact', 'Location', 'Best');
%% Exercise 3
%
% Objective: Compare your method with Euler's Method (from |iode|).
%
% Details: Use |iode| to plot the solution for the same problem with the same
% step size as on Exercise 2.
%
% Compare your solution on exercise 2, the exact solution from exercise 2
% and the approximation using Euler's method. Plot the solution for 
% Euler's method and make note of any differences.
clear all; close all; clc;
f1 = @(x1, x2) (x1 /2) - (2*x2);
f2 = @(x1, x2) (5*x1) - x2;
x1_exact = @(t) exp(-t/4).*((6 / 40)*cos(s*t/4)-(s/20)*sin(s*t/4)+(17/s)*((s/20)*cos(s*t/4)+(6 / 40)*sin(s*t/4)));
x2_exact = @(t) exp(-t/4).*(cos(s*t/4)+(17/s)*(sin(s*t/4)));
n = ((4*pi) / 0.05) + 1; n = round(n);
t = linspace(0, 4*pi, n);
y = @(t, x) [x(1) / 2 - (2*x(2)); 5*x(1) - x(2)];
xinit = 2:1;
xinit(1, 1) = 1;
xinit(2, 1) = 1;
[em] = euler(y, xinit, t);
plot(em(1,:), em(2, :)); hold on;
s = sqrt(151);
%set initial conditions
xinit = 2:1;
xinit(1, 1) = 1;
xinit(2, 1) = 1;
f1 = @(t, x1, x2) (x1 /2) - (2*x2);
f2 = @(t, x1, x2) (5*x1) - x2;
[t,y] = systemsolver_rizzmaster(f1, f2, 0, 4.*pi, xinit, 0.05);
x1_exact = exp(-t/4).*((6 / 40)*cos(s*t/4)-(s/20)*sin(s*t/4)+(17/s)*((s/20)*cos(s*t/4)+(6 / 40)*sin(s*t/4)));
x2_exact = exp(-t/4).*(cos(s*t/4)+(17/s)*(sin(s*t/4)));
plot(y(1,:), y(2,:), 'x--'); hold on;
plot(x1_exact, x2_exact);
title('Results of systemsolver_rizzmaster compared to Eulers method iode & exact soln');
ylabel('x_2'); xlabel('x_1');
legend('euler', 'systemsolver_rizzmaster', 'exact', 'Location', 'Best');
%We can see a clear inaccuracy in Euler's method; the solution circles the
%origin very slowly whereas the solution given by IEM approaches the origin
%much faster.The IEM solution is much closer to the exact solution.

%% Saving Images in MATLAB
%
% To do the following exercises, you will need to know how to output 
% graphics from MATLAB.  Create a folder on your Desktop (or elsewhere) to 
% contain the files generated by these exercises.  Make this folder the 
% "Current Folder" in the left side of the main MATLAB window.  This will 
% ensure that the files output by MATLAB end up in the folder you created.
%
% To save an image of a phase portrait, use the following steps:
%
% 1. Get the phase portrait looking the way you want in the |iode| window.  
%
% 2. Leaving |iode| open, switch to the main MATLAB window.
%
% 3. Type the command |print -dpng -r300 'filename.png'| in the command 
% window.
%
% This command will create a PNG graphic called |filename.png| in the 
% current folder.  The |-dpng| option tells MATLAB to output the graphic in
% PNG format; MATLAB also allows output in other formats, such as BMP, EPS,
% PNG and SVG.  The |-r300| option tells MATLAB to set the resolution at 
% 300 dots per inch and can be adjusted if you wish.


%% Exercise 4
%
% Objective: Analyze phase portraits.
%
% Details: Compile the results of the following exercises into a single
% document (e.g. using a word processor) and export it to |PDF| for
% submission on Quercus. 
%
% For each of the first-order systems of ODEs 4.1 to 4.10 below, do the
% following exercises:
%
% (a) Generate a phase portrait for the system (centre the graph on the
% equilibrium point at (0,0)). Include a few trajectories.
%
% (b) Classify the equilibrium on asymptotic stability, and behaviour 
% (sink, source, saddle-point, spiral, center, proper node, improper node) 
% - check table 3.5.1 and figure 3.5.7.
% Classify also as for clockwise or counterclockwise movement, when relevant.
%
% (c) Compute the eigenvalues of the matrix (you do not need to show your
% calculations). Using the eigenvalues you computed, justify part (b).
%
% To avoid numerical error, you should use Runge-Kutta solver with a step
% size of |0.05|. Change the display parameters, if necessary, to best
% understand the phase portrait.
%

clear all; close all; clc;
% 4.1. |dx/dt = [2 1; 1 3] x|
%
%b) unstable, source; 
%c) eigenvalues: (5 +/- sqrt(5))/2; since eigenvalues are both real and
%positive, the phase lines will all head away from the origin, thereby
%justifying the classication of the phase behaviour as a source (unstable
%node).
%c) eigenvalues: 
% 4.2. |dx/dt = [-2 -1; -1 -3] x|
%
%b) asymptotically stable, sink;
%c) eigenvalues: (-5 +/- sqrt(5))/2; since eigenvalues are both real and negative, 
% the phase lines will all head towards the origin, thereby
%justifying the classification of the phase behaviour as a sink (stable
%node).

% 4.3. |dx/dt = [-4 -6; 3 5] x|
% b) asymptotically unstable saddle
% c) eigenvalues: -1, 2; since both eigenvalues are real, one is positive,
% one negative, an unstable saddle point occurs.
% 4.4. |dx/dt = [4  6; -3 -5] x|
%b) asympotitcally unstable saddle
%c) eigenvalues: 1, -2; since both eigenvalues are real, one is positive,
%one negative, an unstable saddle point occurs.
% 4.5. |dx/dt = [0  -1; 1 -1] x|
% b) asymptotically stable spiral point, counterclockwise movement
% c) eigenvalues: (-1 +/- sqrt(3)i)/2; since both eigenvalues have complex
% parts with the real part being negative, an asymptotically stable spiral
% point occurs.
% 4.6. |dx/dt = [0  1; -1 1] x|
% b) unstable spiral point
%c) eigenvalues: (1 +/- sqrt(3)i)/2; since both eigenvalues have complex
% parts with the real part being positive, an unstable spiral
% point occurs.
% 4.7. |dx/dt = [2  8; -1 -2] x|
% b) stable center
% c) eigenvalues: +/- 2i; since both eigenvalues are imaginary we have a
% center that is stable, but not asymptotically so
% 4.8. |dx/dt = [-2 -8; 1 2] x|
% b) stable center
% c) eigenvalues: +/- 2i; since both eigenvalues are imaginary we have a
% center that is stable, but not asymptotically so
% 4.9. |dx/dt = [-8 5; -13 8] x|
% b) stable center
% c) eigenvalues: +/- i; since both eigenvalues are imaginary we have a
% center that is stable, but not asymptotically so
% 4.10. |dx/dt = [8 -5; 13 -8] x|
% b) stable center
% c) eigenvalues: +/- i; since both eigenvalues are imaginary we have a
% center that is stable, but not asymptotically so
