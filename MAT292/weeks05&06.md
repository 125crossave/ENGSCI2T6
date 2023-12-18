---

---

<h1>MAT292: Ordinary Differential Equations (Weeks 5-6)</h1>

**8.1: Euler's Formula**

Suppose a solution of the IVP 

$\frac{dy}{dt} = f(t,y), y(t_0) = y_0$ 	(1)

is given by $y = \phi(t)$ and you have a sequence of points $t_0 < t_1 < t_2 < ... < t_n < ...$

For $n = 0, 1, 2, ...$ we have the following:

*Approximation of $y = \phi(t)$ at $t = t_{n+1}$*:

$y_{n+1} = y_n + f(t_n, y_n)(t_{n+1} - t_n)$	(2)

*Linear approximation of $y = \phi(t)$* *on the interval* $[t_n, t_{n+1}]$:

$y(t) = y_n + f(t_n, y_n)(t - t_n)$	(3)

*Special case*: If a uniform step size $h$ is used, then $t_{n+1} - t_n = h$ for all $n$, and so (2) simplifies to

$y_{n+1} = y_n + hf(t_n, y_n)$	(4)

**8.2: Accuracy of Numerical Methods**

*Errors in Numerical Approximations*

When designing a numerical procedure we must consider the question of **convergence**: that is, whether the values of the numerical approximation $y_1, y_2, ..., y_n, ...$ approach 0 as $h$ tends to 0. Assuming this is true, we must also consider how quickly the numerical approximation converges to the solution.

Two fundamental sources of error exist when approximating the solution of an IVP numerically.

The difference $E_n$ between the solution $y = \phi(t)$ of the IVP (1) and its numerical approximation $y_n$ is given by 

$E_n = \phi(t_n) - y_n$ 	(5)

and is known as the **global truncation error**. It arises from two causes: First, at each step we are using an approximate formula to determine $y_{n+1}$; second, the input data at each step are only approximately correct. For example: when we calculate $y_{n+1}$ we are using $y_n$ instead of the exact solution $\phi(t_n)$, but generally $y_n \neq \phi(t_n)$. If we assume $y_n = \phi(t_n)$ then the only error when we go one step forward is due to the use of an approximate formula (i.e. only the first cause, and not the second cause). This error is known as the **local truncation error** $e_n$.

The second source of error is that we carry out computations in arithmetic with only a finite number of digits, which leads to a **round-off error** $R_n$ defined by 

$R_n = y_n - Y_n$ 	(6)

The absolute value of the total error in computing $\phi(t_n)$ is given by 

$|\phi(t_n) - Y_n| \leq |E_n| + |R_n|$	(7)

*Local Truncation Error for Euler Method*

If $\phi$ is a solution the the IVP (1) and has a continuous 2nd derivative in the interval we care about, then making use of a Taylor polynomial to expand $\phi$ about $t_n$ we get

$\phi(t_n + h) = \phi(t_n) + \phi'(t_n)h + \frac{1}{2}\phi''(\bar{t_n})h^2$	(8)

where $\bar{t_n}$ is some point in the interval $t_n < \bar{t_n} < t_n + h$. Subtracting (4) from (8), we get

$\phi(t_{n+1}) - y{n+1} = \phi(t_n) - y_n + h(f(t_n, \phi(t_n) - f(t_n, y_n)) - f(t_n, y_n)) + \frac{1}{2}\phi''(\bar{t_n})h^2$	(9)

To compute the local truncation error $e_{n+1}$, we apply $y_n = \phi(t_n)$. But then this gives

$e_{n+1} = \phi(t_{n+1}) - y_{n+1} = \frac{1}{2}\phi''(\bar{t_n})h^2$	(10)

Thus the local truncation error for the Euler method is proportional to the square of the step size, and the proportionality factor depends on the second derivative of the solution $\phi$. In general, the expression in (10) is different for each step, but a unform bound valid on an interval $[a, b]$ is given by

$|e_n|\leq \frac{Mh^2}{2}$ (11)

where $M$ is the maximum of $|\phi''(t)|$ on the interval $[a,b]$. One use of (11) is to choose a step size that will result in a local truncation error no greater than some given tolerance level. For example, if the local truncation error must be no greater than $\epsilon$, then from (11) we have

$\sqrt{\frac{2\epsilon}{M}} \geq h$	(12)

**8.3: More Advanced Numerical Methods**

**Improved Euler Method:** Suppose the solution of the IVP (1) is given by $y = \phi(t)$ and you have a sequence of points $t_0 < t_1 < t_2 < ... < t_n < ...$

For $n = 0, 1, 2, ...$ we have the following:

*Approximation of $y = \phi(t)$ at $t = t_{n+1}$*:

$y_{n+1} = y_n + \frac{f(t_n, y_n) + f(t_n + h, y_n + hf(t_n, y_n))}{2}h$	(13)

where $t_{n+1} - t_n = h$.

*Linear Approximation of $\phi(t)$* on the interval $[t_n, t_{n+1}]$:

$y(t) = y_n + f(t_n, y_n)(t - t_n)$	(14)

*Special case:* If $f(t,y) = f(t)$, then (13) simplifies to 

$y_{n+1} = y_n + \frac{h}{2}[f(t_n) + f(t_n + h)]$	(15)

**Runge-Kutta Method:** Suppose the solution of the IVP (1) is given by $y = \phi(t)$ and you have a sequence of points $t_0 < t_1 < t_2 < ... < t_n < ...$

For $n = 0, 1, 2, ...$ , and $f(t,y) = f(t)$, then we have

$y_{n+1} = y_{n} + \frac{h}{6}\left[f(t_n) + 4f\left(t_n + \frac{h}{2}\right) + f(t_n + h)\right]$



**6.2 Theory of First Order Linear Systems**

**6.5 Fundamental Matrices and the Exponential of a Matrix**



------

*Let $\textbf{A}$ be an $n\times n$ constant matrix. Then the **matrix exponential function** denoted by $e^{\textbf{A}t}$ is defined as*

$e^{\textbf{A}t} = \textbf{I}_n + \textbf{A}t + \frac{1}{2!}\textbf{A}^2t^2 + \frac{1}{3!}\textbf{A}^3t^3 + ... = \sum_{k = 0}^{\infty}\textbf{A}^k\frac{t^k}{k!}$

------

*If $\textbf{A}$ is an $n \times n$ constant matrix, then $e^{\textbf{A}t} = \boldsymbol{\Phi}(t)$ where ${\boldsymbol{\Phi}}$ is the fundamental matrix foy the system $\textbf{x}' =\textbf{Ax}$, and $\textbf{x} = e^{\textbf{A}t}\textbf{x}_0$. Also, $\boldsymbol{\Phi}' = \textbf{A}\boldsymbol{\Phi}$ where $\boldsymbol{\Phi}(0) = \textbf{I}_n$.

