<h1>MAT292: Ordinary Differential Equations (Weeks 3-4)</h1>

------

<h3>2.5 Autonomous Equations and Population Dynamics</h3>

In this section, we discuss autonomous equations in the context of various real-world applications.

*Exponential Growth*

Let $y = \phi(t)$ be the populaiton of a given species at time $t$. We hypothesize that the rate of change of $y$ is proportional to the current value of $y$. Then 

$\frac{dy}{dt} = ry$ 			(1)

where the constant of proportionality $r$ is the *rate of growrth or decline*, depending on its sign. Here we assume that $r > 0$, i.e. the population is growing. 

If we solve (1) using the initial condition $y(0) = y_0$, then we get $y = y_0e^{rt}$. Thus this mathematical model predicts exponential growth, which is feasible under ideal conditions, but not in the real world where limitations on factors such as space, food supply, etc. are in play.

*Logistic growth* 

To account for the fact that growth rate actually depends on the populaiton, we replace the constant $r$ in (1) by a funciton $h(y)$ and thus obtain the modified equaiton 

$\frac{dy}{dt} = h(y)y$ 		(2)

Now we want to choose $h(y)$ such that $h(y) \approx r > 0$ when $r$ is small, $h(y)$ decreases as $y$ grows larger, and $h(y) < 0$ when $y$ is sufficiently large. The simplest equation that meets these requirements is $h(y) = r - ay$ where $a$ is also positive constant. Using this function in (2) we get

 $\frac{dy}{dt} = (r - ay)y$		(3)

(3) is known as the Verhulst, or *logistic equation*. It is convenient to write (3) in the equivalent form

$\frac{dy}{dt} = r(1-\frac{y}{K})y$		(4)

where $K = \frac{r}{a}$. In (4), the constant $r$ is referred to as the *intrinsic growth rate*, i.e. the grwoth rate in the absence of any limiting factors.

*Example: Cane toads*

If we model cane toads usuing the above formula then the points of inflection occur at

$\frac{d^2 y}{dt^2} = r^2 y(1- \frac{y}{K})(1-\frac{2y}{K})$		(5)

So points of inflection are $y = k, 0, y = \frac{k}{2}$

The general solution of (4) is

$y = \frac{K}{C'e^{-rt} + 1}$		(6)

and if we let $y(0) = y_0$ then $C' = \frac{K}{y_0} - 1$

![image-20230911172313828](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20230911172313828.png)

PLotting various solutions, appears that a threshold level $T$ exists--below this level, solutions approach 0; above, they grow unbounded. Therefore we would like a function such that instead of the ROC being $r$, it is $rg(y)$ where

- $g(y) < 0$if $y < T$
- $g(y) > 0 if y > T$
- $g(y) \approx -1$ if $y \approx 0$

A candidate is:

$g(y) = \frac{y}{T} -1$		(7)

Thus our new proposal for the model is $\frac{dy}{dt} = r(\frac{y}{T} - 1)y$

However, a problem is that if the initial condition $y_0$ > $T$, then the population will become infinity before $t$ reeaches infinity. (since, solving for $t$ we get $\ln{\frac{y_0}{y_0 - T}}$)

Thus we want another model such that 

$\frac{dy}{dt} = rq(y)y$		(8)

where 

- q(y) < 0 if $y < T$, 
- q(y) > 0 if $T < y < K$
- q(y) < 0 if $y > K$

One solution which fulfills these constraints is

$\frac{dy}{dt} = r(1-\frac{y}{K})(\frac{y}{T} - 1)y$		(9)

------

<h2>3	Systems of Two First Order Equations</h2>

<h3>3.2 Systems of Two First Order Linear Differential Equations</h3>

*Solutions of Two First Order Linear Equations*

The general system of two first order linear differential equations is:

$\begin{pmatrix}\frac{dx}{dt}\\\frac{dy}{dt}\end{pmatrix} = \begin{pmatrix}p_{11}(t)x + p_{12}(t)y + g_1(t)\\p_{21}(t)x + p_{22}(t)y + g_2(t)\end{pmatrix}$		(10)

which can be written as 

$\frac{d\textbf{x}}{dt} = \textbf{P}(t)\textbf{x} + \textbf{g}(t)$		(11)

where $\textbf{x}$ = $\begin{pmatrix}x\\y\end{pmatrix}$, $\textbf{P}(t) = \begin{pmatrix}p_{11}(t) & p_{12}(t)\\p_{21}(t) & p_{22}(t)\end{pmatrix}$, $\textbf{g}(t) = \begin{pmatrix}g_1(t)\\g_2(t)\end{pmatrix}$		(12)

- $x$ and $y$ are called **state variables** since their values determine the state of the system
- $\textbf{x}$ is the **state vector**
- The $xy$-plane is called the state/**phase plane**

(10) is called a **first-order linear system of dimension two** since it consists of first-order equations and its state space (the $xy$-plane) is two-dimensional. Further, if $\textbf{g}(t) = \textbf{0}$ for all $t$, i.e. $g_1(t) = g_2(t) = 0$ for all $t$, then the system is said to be **homogeneous**. Otherwise, it is **nonhomogeneous**.

Frequently, we have initial conditions

$x(t_0) = x_0$, $y(t_0) = y_0$, or alternatively $\textbf{x}(t_0) = \textbf{x}_0$.		(13)

Together, equations (10) and (13) form an **initial value problem**.

------

***Theorem 3.2.1: Existence and Uniqueness of Solutions***

Let each of the functions $p_{11}, ..., p_{22}, g_1$, and $g_2$ be continuous on an open interval $I = \alpha < t < \beta$, let $t_0$ be any point in $I$, and let $x_0$ and $y_0$ be any given numbers. Then there exists a unique solution of (10)

$\begin{pmatrix}\frac{dx}{dt}\\\frac{dy}{dt}\end{pmatrix} = \begin{pmatrix}p_{11}(t)x + p_{12}(t)y + g_1(t)\\p_{21}(t)x + p_{22}(t)y + g_2(t)\end{pmatrix}$

that also satisfies the initial conditions

$x(t_0) = x_0, \,\,\,y(t_0) = y_0$

Further, the solution exists throughout the interval $I$.

------

- Observe that the interval of existence of the solution is the entire interval I in which the hypotheses are satisfied.

- Further, the initial values $x_0$ and $y_0$ are completely arbitrary.

*Linear Autonomous systems*

If the right side of (11) does not depend explicitly on the independent variable $t$, then the system is **autonomous**. For a system to be autonomous, the elements of the coefficient matrix $\textbf{P}$ and the components of the vector $\textbf{g}$ must be constants. We use the notation

$\frac{d\textbf{x}}{dt} = \textbf{Ax} + \textbf{b}$	(14)

where $\textbf{A}, \textbf{b}$ are filled with constant elements, to denote autonomous linear systems. Since entries of $\textbf{A}$ and $\textbf{b}$ are constants, and thus continuous, the Existence and Uniqueness Theorem implies that any solution of (14) exists and is unique on the entire $t$-axis.

We can find the **equilibrium solutions**, or **critical points**, by setting $\frac{d\textbf{x}}{dt}$ equal to zero. As such, any solution of

$\textbf{Ax} = -\textbf{b}$	(15)

is a solution of (14). If $\textbf{A}$ is invertible, then a single solution exists to (15): $\textbf{x} = -\textbf{A}^{-1}\textbf{b}$; this then is the only critical point of (14). However, if $\textbf{A}$ is singular, then (15) either has no solutions or infinitely many.

*Example #1*

Let $x(t)$ and $y(t)$ be the number of users on Twitch and Mixer. Assume that

- For every user on Twitch, Twitch gains two users
- For every user on mixer, Mixer gains 4 users
- Twitch loses one viewer for every viewer on Mixer
- Mixer loses 3 viewers for every viewer on Twitch
- Twitch consistently gains 200 viewers
- Mixer consistently gains 50

How to describe both platforms?

$\frac{dx}{dy} = 2x - y + 200$

$\frac{dy}{dt} = 4y - 3x + 50$

Which can be rewritten as:

$\begin{pmatrix}x'\\y'\end{pmatrix} = \begin{pmatrix}2&-1\\-3&4\end{pmatrix}\begin{pmatrix}x\\y\end{pmatrix} + \begin{pmatrix}200\\50\end{pmatrix}$

*Example #2*

Let $x(t)$ be the number of users on Twitch and $y(t)$ the number of users on Apex Legends. Assume that

- For every Apex player, Twitch gains one user
- For every two Twitch users, Apex gains one player
- For every user on Twitch, Twitch loses two users due to school
- For every player on Apex, Apex loses two players due to school
- Twitch consistently gains 200 users
- Apex consistently gains 20

This gives us

$\frac{dx}{dt} = -2x + y + 200$

$\frac{dy}{dt} = 0.5x -2y + 20$

Which can be written as

$\begin{pmatrix} x'\\y'\end{pmatrix} = \begin{pmatrix}-2 & 1\\0.5&-2\end{pmatrix}\begin{pmatrix} x\\y\end{pmatrix} + \begin{pmatrix} 200\\20\end{pmatrix}$

To find the equilibrium solution, let $\begin{pmatrix} x'\\y'\end{pmatrix} = \textbf{0}$:

$\begin{pmatrix} 0 \\ 0\end{pmatrix} = \begin{pmatrix}-2 & 1\\0.5&-2\end{pmatrix}\begin{pmatrix} x\\y\end{pmatrix} + \begin{pmatrix} 200\\20\end{pmatrix}$

Solving, we get

$\begin{pmatrix} x\\y\end{pmatrix} = \begin{pmatrix}120\\40\end{pmatrix}$

------

<h3>3.3 Homogenous Linear Systems with Constant Coefficients</h3>

If $\textbf{A}$ is invertible, we can convert nonhomogenous linear systems to homogenous ones by shifting the origin of the phase plane so that it coincides with a critical point.

Consider first order linear system w/ constant $\textbf{A}$ and $\textbf{b}$:

$\textbf{x}' = \textbf{Ax} + \textbf{b}$

where $\textbf{x}(t) = \begin{pmatrix}x_1(t)\\x_2(t)\end{pmatrix}$, $\textbf{A} = \begin{pmatrix}a_{11}&a_{12}\\a_{21}&a_{22}\end{pmatrix}$, $\textbf{b} = \begin{pmatrix}b_1\\b_1\end{pmatrix}$.

Let $\textbf{x} = \textbf{x}_{eq} + \tilde{\textbf{x}}$ where $\tilde{\textbf{x}}$ is independent of $t$. Then, if we plug this into the system we get

$\textbf{x}' = \textbf{Ax} + \textbf{Ax}_{eq} + \textbf{b}$

and, assuming $\textbf{A}$ is invertible, then

$\textbf{x}_{eq} = -\textbf{A}^{-1}\textbf{b}$

Which gives us the homogenous linear system

$\textbf{x}' = \textbf{Ax}$ 	(16)

However, if $\textbf{A}$ is singular, there may be no critical points, and then it will not be possible to reduce the nonhomogeneous system to a homogeneous one in this manner.

*Superposition principle*

If $\textbf{x}_1$ is a solution of (16) and $c_1$ is arbitrary constant, then $\textbf{x} = c_1\textbf{x}_1$ is also a solution of (16). To show this, we need to show that 

$(c_1\textbf{x}_1)' - \textbf{A}c_1\textbf{x}_1$	(17)

is zero. But we can write

$(c_1\textbf{x}_1)' - \textbf{A}c_1\textbf{x}_1 = c_1(\textbf{x}'_1 - \textbf{Ax}_1)$	(18)

and the RHS of 18 is zero since $\textbf{x}_1$ is a solution of (18); as such, the expression in (17) is also zero, which proves that $c_1\textbf{x}_1$ is a solution to (16) for any constant $c_1$.

Using this knowledge, we can make the following observation.

------

***Theorem 3.3.1: Principle of Superposition***

Suppose that $\textbf{x}_1(t)$ and $\textbf{x}_2(t)$ are solutions of (16):

$\textbf{x}' = \textbf{Ax}$	(19)

Then, the expression 

$\textbf{x}(t) = c_1\textbf{x}_1(t) + c_2\textbf{x}_2(t)$	(20)

where $c_1, c_2$ are arbitrary constants, is also a solution.

------

Suppose now that there is a prescribed initial condition 

$\textbf{x}(t_0) = \textbf{x}_0$	(21)

where $t_0$is any value of $t$, and $\textbf{x}_0$ is any given constant vector. If we apply (21) to (20) then we get, in matrix form,

$\begin{pmatrix}x_{11}(t_0) & x_{12}(t_0)\\x_{21}(t_0) & x_{22}(t_0)\end{pmatrix}\begin{pmatrix}c_1\\c_2\end{pmatrix} = \begin{pmatrix}x_{10}\\x_{20}\end{pmatrix}$	(22)

According to Theorem 3.1.1, (22) can be solved uniquely for $c_1$ and $c_2$ for any values of $x_{10}$ and $x_{20}$ iff the determinant of the coefficient matrix is nonzero. This determinant,

$W[\textbf{x}_1,\textbf{x}_2](t) = \begin{vmatrix}x_{11}(t_0) & x_{12}(t_0)\\x_{21}(t_0) & x_{22}(t_0)\end{vmatrix}$	(23)

is called the **Wronskian** of the two solutions $\textbf{x}_1(t)$ and $\textbf{x}_2(t)$. Thus the IVP (19), (21) has a unique solution iff the Wronskian $\neq 0$.

------

***Definition 3.3.2: Linear Independence of Solutions* **

Suppose that $\textbf{x}_1(t)$ and $\textbf{x}_2(t)$ are solutions of (16) on the interval $I$. Then $\textbf{x}_1$ and $\textbf{x}_2$ are **linearly dependent** if some $k \in \mathbb{R}$ exists such that $\textbf{x}_1(t) = k\textbf{x}_2(t)$ for all $t$ in $I$. (In other words, $\textbf{x}_1$ is a constant multiple of $\textbf{x}_2$).

Otherwise, $\textbf{x}_1$ and $\textbf{x}_2$ are **linearly independent**.

------

- Geometrically, if two vectors in the plane are linearly dependent and they are translated so their tails coincide with the origin, then the vectors lie on the same line through the origin. If they are linearly independent, this is not true. This observation will be helpful when forming phase portraits for (16).

The following theorem states how the Wronskian can be used to determine whether two solutions of (16) are linearly independent.

------

***Theorem 3.3.3: Wronskian and Linear Independence***

Suppose that

$\textbf{x}_1(t) = \begin{pmatrix}x_{11}(t)\\x_{21}(t)\end{pmatrix}$ and $\textbf{x}_2(t) = \begin{pmatrix}x_{12}(t)\\x_{22}(t)\end{pmatrix}$

are solutions of (16) on an interval $I$. Then $\textbf{x}_1$ and $\textbf{x}_2$ are **linearly independent** iff $W[\textbf{x}_1, \textbf{x}_2](t) \neq 0$ for all $t \in I$.

------

- Accordingly, two linearly independent solutions of Eq. (13) are often called a fundamental set of solutions.
- If $\textbf{x}_1(t)$ and $\textbf{x}_2(t)$ comprise a fundamental set of (16), then the linear combination of $\textbf{x}_1$ and $\textbf{x}_2$ given by (20) with arbitrary coefficients $c_1$ and $c_2$ is called the **general solution** of (16).

------

*x' = Ax as an Eigenvalue problem*

- We can alter (19)

![](C:\Users\Justin\Downloads\Pictures\2023-09-20_171912.png)

<h3>3.4 Complex Eigenvalues, 3.5 Repeated Eigenvalues</h3>

If $\textbf{A}$ is a real matrix which has a complex eigenvalue $\lambda_1 = a + bi$, then its complex conjugate $\lambda_2 = a - bi$ is also an eigenvalue. 

***Procedure for Finding the General Solution of x′ = Ax When A Has Complex Eigenvalues***

1. Identify the complex conjugate eigenvalues $\lambda = \mu \pm iv$

2. Determine the eigenvector $\textbf{v} = \begin{pmatrix}v_1\\v_2\end{pmatrix}$ corresponding to $\lambda_1 = \mu + iv$ by solving $(\textbf{A} -\lambda_1I)\textbf{v} = 0$

3. Express $\textbf{v} $ as $\textbf{a} + i\textbf{b}$ 

4. Write the solution $\textbf{x}_1(t)$ corresponding to $\textbf{v}$ and separate it into real and imaginiary parts

   $\textbf{x}_1(t) = e^{\mu t}(\textbf{a}\cos(vt) - \textbf{b}\sin(vt)) + ie^{\mu t}(\textbf{a}\cos(vt) + \textbf{b}\sin(vt))$ where 

   - $\textbf{u} = e^{\mu t}(\textbf{a}\cos(vt) - \textbf{b}\sin(vt))$ 
   - $\textbf{w} = ie^{\mu t}(\textbf{a}\cos(vt) + \textbf{b}\sin(vt))$
   - $\textbf{u} and \textbf{w}$ form a fundamental set of solutions for $\textbf{x}' = \textbf{Ax}$

5. Then the general solution of $\textbf{x}' = \textbf{Ax}$ is

​	$\textbf{x}(t) = c_1\textbf{u}(t) + c_2\textbf{w}(t)$ 	(24)

​	where $c_1,c_2$ are arbitrary constants.

If the real part $a$ of the eigenvalues is positive, then trajectories of $\textbf{u} and \textbf{w}$, which are fundamental set of real-valued solutions of the system, will flow away from theorigin (which is then a **spiral source** and is unstable equilibrium); if negative, they will flow towards (which makes the origin a **spiral sink** and thus an asymptotically stable equilibrium. If $a = 0$, trajectories will simply circle the origin without approaching or growing unbounded-- they are **stable**, but not asymptotically so. In all three cases, the direction of motion can either be clockwise or counterclockwise depending on the components of $\textbf{A}$.

We now have completed our description of the three main cases that can occur:

1. Real eigenvalues but opposite signs; $\textbf{x} = \textbf{0}$ is a saddle point
2. Real eigenvalues, same sign, unequal; $\textbf{x} = \textbf{0}$ is a node
3. Complex eigenvalues; $\textbf{x} = \textbf{0}$ is a spiral point
