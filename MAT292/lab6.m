%% Laplace Transform Lab: Solving ODEs using Laplace Transform in MATLAB
%
% This lab will teach you to solve ODEs using a built in MATLAB Laplace 
% transform function |laplace|.
%
% There are five (5) exercises in this lab that are to be handed in.  
% Write your solutions in a separate file, including appropriate descriptions 
% in each step.
%
% Include your name and student number in the submitted file.
%
%% Using symbolic variables to define functions
% 
% In this exercise we will use symbolic variables and functions.

syms t s x y

f = cos(t)
h = exp(2*x)


%% Laplace transform and its inverse

% The routine |laplace| computes the Laplace transform of a function

F=laplace(f)

%%
% By default it uses the variable |s| for the Laplace transform
% But we can specify which variable we want:

H=laplace(h)
laplace(h,y)

% Observe that the results are identical: one in the variable |s| and the
% other in the variable |y|

%% 
% We can also specify which variable to use to compute the Laplace
% transform:

j = exp(x*t)
laplace(j)
laplace(j,x,s)

% By default, MATLAB assumes that the Laplace transform is to be computed
% using the variable |t|, unless we specify that we should use the variable
% |x|

%% 
% We can also use inline functions with |laplace|. When using inline
% functions, we always have to specify the variable of the function.

l = @(t) t^2+t+1
laplace(l(t))

%% 
% MATLAB also has the routine |ilaplace| to compute the inverse Laplace
% transform

ilaplace(F)
ilaplace(H)
ilaplace(laplace(f))

%% 
% If |laplace| cannot compute the Laplace transform, it returns an
% unevaluated call.

g = 1/sqrt(t^2+1)
G = laplace(g)

%% 
% But MATLAB "knows" that it is supposed to be a Laplace transform of a
% function. So if we compute the inverse Laplace transform, we obtain the
% original function

ilaplace(G)

%%
% The Laplace transform of a function is related to the Laplace transform 
% of its derivative:

syms g(t)
laplace(diff(g,t),t,s)


%% Exercise 1
%
% Objective: Compute the Laplace transform and use it to show that MATLAB
% 'knows' some of its properties.
%
% Details:  
%
% (a) Define the function |f(t)=exp(2t)*t^3|, and compute its Laplace
%   transform |F(s)|.
clear all; close all; clc;
syms f(T) T S A;
f(T) = exp(2*T) * T^3;
F =laplace(f);disp(F);
% (b) Find a function |f(t)| such that its Laplace transform is
%   |(s - 1)*(s - 2))/(s*(s + 2)*(s - 3)|
h = ((S-1)*(S-2) )/(S * (2 + S) *(S - 3));
H = ilaplace(h);disp(H);

% (c) Show that MATLAB 'knows' that if |F(s)| is the Laplace transform of
%   |f(t)|, then the Laplace transform of |exp(at)f(t)| is |F(s-a)| 
% (in your answer, explain part (c) using comments).      
%
% Observe that MATLAB splits the rational function automatically when
% solving the inverse Laplace transform.

clear all; syms f(T) A S T;
disp(laplace(f(T), T, S)) %displays laplace(f(T), T, S)
disp(laplace(exp(A * T) * f(T), T, S)) %displays laplace(f(T), T, S - A)

%We can see that even though f(T) was not defined, MATLAB still knows
% that multiplying it by e^T must shift S to the right by A as evidenced by the 
% displaying of laplace(f(T), T, S) before multiplication by e^T and displaying of 
% laplace(f(T), T, S - A) after multiplication of f(T) by e^T,
% signifying that when f(T) is transformed to F(S), f(T)*e^T is transformed
% to F(S-A).

%% Exercise 2
%
% Objective: Find a formula comparing the Laplace transform of a 
%   translation of |f(t)| by |t-a| with the Laplace transform of |f(t)|
%
% Details:  
%
% * Give a value to |a|
% * Let |G(s)| be the Laplace transform of |g(t)=u_a(t)f(t-a)| 
%   and |F(s)| is the Laplace transform of |f(t)|, then find a 
%   formula relating |G(s)| and |F(s)|
%
% In your answer, explain the 'proof' using comments.
clear all; close all; clc;
syms s a t f(t);
a = 1;
f(t) = exp(2*t) * t^3;
F(s) = laplace(f(t), t,s) %F(s) =6/(s - 2)^4
G(s) = laplace( heaviside(t - a) * f(t - a), t,s) %G(s)=(6*exp(-s))/(s - 2)^4

G(s)/F(s) %ans =exp(-s)t


% IT is stated in textbook that multiplying f(t-a) by u_a(t) leads to
% multiplication of F(s) by e^{-as} in the s-domain. (i.e.
% L^-1{e^{-as}F(s)} = u_a(t)f(t-a)). This is consistent with the results
% demonstrated here: MATLAB displays the formula for G(s)/F(s) is equal to
% e^{-s} when a is set to the value of 1, showing that multiplying F(s) by
% e^{-as} = e^{-s} yields G(s), which is the multiplication of f(t-a) = f(t-1) by
% u_a(t) = u_1(t).
%% Solving IVPs using Laplace transforms
%
% Consider the following IVP, |y''-3y = 5t| with the initial
% conditions |y(0)=1| and |y'(0)=2|.
% We can use MATLAB to solve this problem using Laplace transforms:

% First we define the unknown function and its variable and the Laplace
% tranform of the unknown

syms y(t) t Y s

% Then we define the ODE

ODE=diff(y(t),t,2)-3*y(t)-5*t == 0

% Now we compute the Laplace transform of the ODE.

L_ODE = laplace(ODE)

% Use the initial conditions

L_ODE=subs(L_ODE,y(0),1)
L_ODE=subs(L_ODE,subs(diff(y(t), t), t, 0),2)

% We then need to factor out the Laplace transform of |y(t)|

L_ODE = subs(L_ODE,laplace(y(t), t, s), Y)
Y=solve(L_ODE,Y)

% We now need to use the inverse Laplace transform to obtain the solution
% to the original IVP

y = ilaplace(Y)

% We can plot the solution

ezplot(y,[0,20])

% We can check that this is indeed the solution

diff(y,t,2)-3*y


%% Exercise 3
%
% Objective: Solve an IVP using the Laplace transform
%
% Details: Explain your steps using comments
%
%
% * Solve the IVP
% *   |y'''+2y''+y'+2*y=-cos(t)|
% *   |y(0)=0|, |y'(0)=0|, and |y''(0)=0|
% * for |t| in |[0,10*pi]|
% * Is there an initial condition for which |y| remains bounded as |t| goes to infinity? If so, find it.
clear all; close all; clc;
syms t y(t) s Q;
%perform laplace transform on te ODE
L_ODE = laplace(diff(y(t), t, 3) + (2 * diff(y(t),t,2)) + diff(y(t), t,1) + 2 * y(t)+ cos(t)==0);
%sub in te initial conditions
L_ODE =subs(L_ODE, y(0), 0); L_ODE = subs(L_ODE, subs(diff(y(t),t), t,0), 0);
L_ODE= subs(L_ODE, subs(diff(y(t), t,2),t,0),0);
%now solve to obtian Y(s) = Q
L_ODE = subs(L_ODE, laplace( y(t), t, s) , Q); Q=solve(L_ODE, Q);
%find the solution y via inverse laplace of Q
y(t)=ilaplace(Q) %y(t) = (2*exp(-2*t))/25 - (2*cos(t))/25 + (3*sin(t))/50 + (t*cos(t))/10 - (t*sin(t))/5
%verify that this is the solution
check = diff(y(t),t,3) + (2 * diff(y(t),t,2)) + diff(y(t), t,1) + 2 * y(t)+ cos(t) %check = 0
%plot
ezplot(y,[0,10*pi]); title("soln of the IVP on [0,10pi]");
ylabel('y');xlabel('t');
%there is no condition that allows y to remain bounded as t goes to
%infinity, which can be seen thru the genral solution 
% y =A*cos(t)+B*sin(t) +C*exp(-2*t) +t*sin(t)/5 +t*cos(t)/10

%% Exercise 4
%
% Objective: Solve an IVP using the Laplace transform
%
% Details:  
% 
% * Define 
% *   |g(t) = 3 if 0 < t < 2|
% *   |g(t) = t+1 if 2 < t < 5|
% *   |g(t) = 5 if t > 5|
%
% * Solve the IVP
% *   |y''+2y'+5y=g(t)|
% *   |y(0)=2 and y'(0)=1|
%
% * Plot the solution for |t| in |[0,12]| and |y| in |[0,2.25]|.
%
% In your answer, explain your steps using comments.
clear all; close all; clc;
syms y(t) t Q s;
%define g in terms of step functions
g(t) =(4-t) * heaviside( t- 5) + (t-2)*heaviside(t-2) + 3*heaviside(t);
%Perform laplace transform on ODE
L_ODE = laplace(diff(y(t), t,2)+ 2*diff(y(t),t)+ 5* y(t) - g(t)== 0);
%sub in initial conditions
L_ODE = subs(L_ODE, y(0),2); L_ODE = subs(L_ODE, subs(diff(y(t), t),t,0), 1);
%now solve to obtian Y(s) = Q
L_ODE=subs(L_ODE, laplace(y(t),t,s),Q);Q = solve(L_ODE, Q);
%find the solutoin via inverse laplace transform of Q
y = ilaplace(Q);
%verify that this is the solution
check = simplify(diff(y,t,2)+2*diff(y,t)+5*y-g)%check = 3 - 3*heaviside(t) which is 0 for t>0, 
% which is where the soln is defined
%plot the soln
ezplot(y,[0,12,0,2.25]);title("soln of the IVP on [0,12]");
ylabel('y');xlabel('t');

%% Exercise 5
%
% Objective: Use the Laplace transform to solve an integral equation
% 
% Verify that MATLAB knowns about the convolution theorem by explaining why the following transform is computed correctly.
syms t tau y(tau) s
I=int(exp(-2*(t-tau))*y(tau),tau,0,t) %int(exp(2*tau - 2*t)*y(tau), tau, 0, t)
disp(laplace(I,t,s)) %laplace(y(t), t, s)/(s + 2)

%We can apply the convolution theorem by consider y(t) to be f and
%g(t) to be e^{-2(t)}.This makes I the convolution between f and
%g. If we take the Laplace transform (denoted by L) of I, then the convolution theorem
%states that we should obtain 
% L{I} = L{f}L{g} = L{y(t)}L{e^{-2(t)} = L{y(t)}/(s + 2)
%which is what MATLAB says we should get, through its display of
%laplace(y(t), t, s)/(s + 2). As such, MATLAB knows about the convolution
%theorem.