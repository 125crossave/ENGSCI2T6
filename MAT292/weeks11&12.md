<h1>MAT292: Ordinary Differential Equations (Weeks 11 & 12)</h1>

**5.7 Impulse Functions**

Definition:

$\int_a^b \delta(t - t_0) \,dt = 1$ if $t_0 \in [a, b)$, 

​			$= 0$ otherwise	(1)

*Properties*:

$\int_a^b f(t)\delta(t-t_0)\,dt$ = $f(t_0)$ if  $t_0 \in [a, b)$	(2)

Proof: <img src="C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231204124714030.png" alt="image-20231204124714030" style="zoom:50%;" />

Laplace transform:

$\mathcal{L}\{\delta(t-t_0)\} = \int_0^{\infty}e^{-st}\delta(t-t_0)\,dt=e^{-st_0}$	(3)

for all $t_0 \geq 0$. When $t_0 = 0$, 

$\mathcal{L}\{\delta(t)\} = 1$	(4)

**5.8 Convolution Integrals and their Applications** 

Definition: 

Let $f$ and $g$ be piecewise continuous functions on $[0, \infty)$. Then the **convolution** of $f$ and $g$ is defined by

$h(t) = \int_0^tf(t-\tau)g(\tau)\,d\tau$	(5)

We can express $h$ using the notation $f*g$. Key properties of $h$ are listed below

![image-20231204145833649](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231204145833649.png)

*Convolution Theorem*

------

**Theorem 5.8.1** 

If $F(s) = \mathcal{L}\{f(t)\}$ and $G(s) =\mathcal{L}\{g(t)\}$ both exist for $s > a \geq 0$, then

$H(s) = F(s)G(s) = \mathcal{L}\{h(t)\}$,	$s > a$	(6)

where $h(t) = \int_0^tf(t-\tau)g(\tau)\,d\tau = \int_0^tf(t)g(t-\tau)\,d\tau$	(7)

------

Key terms:

For the IVP $ay'' + by' + cy = g$,	$y(0) = y_0$,	$y'(0) = y_1$	(8)

which is commonly referred to as an **input-output problem**, where the solution to this IVP, called the **total response**, can be separated into two parts: the **forced response** and the **free response**.

By taking the Laplace transform of (8) we obtain

$(as^2 + bs + c)Y(s) - (as+b)y_0 -ay_1 = G(s)$	(9)

If we let $H = \frac{1}{as^2 + bs + c}$, then 

$Y(s) = H(s)[(as+b)y_0 + ay_1] + H(s)G(s)$	(10)

Which means that 

$y(t) = \mathcal{L}^{-1}\{H(s)[(as+b)y_0 + ay_1]\} + \int_0^th(t-\tau)g(\tau)d\tau$	(11)

Observe that the first term on the RHS of (11) solves the IVP

$ay'' + by' + cy = 0$, $y(0) = y_0$,	$y'(0) = y_1$	(12)

Which is obtained by setting $G(s) = 0$. The solution to the IVP (12) is called the **free response** of the system in the $t$-domain. In the $s$-domain, it is represented by the first term on the RHS of (10).

The second term on the RHS of (11) is the solution to 

$ay'' + by' + cy = g$,	$y(0) = 0$,	$y'(0) = 0$	(13)

Wherein $y_0$ and $y_1$ are both replaced by 0.The solution of the IVP (13) Is called the **forced response** of the system, in the $t$-domain. Its counterpart in the $s$-domain is given by the second term of the RHS in (10), with the two representations being equivalent via Theorem 5.8.1.

An alternative expression for the **free response** is 

$y(t) = \alpha_1y_1(t) + \alpha_2y_2(t)$	(14)

where $y_1$, $y_2$ comprise a fundamental set of solutions to $ay'' + by' + cy = 0$, and 

$\alpha_1 = \frac{y_0y_2'(0) - y_1y_2(0)}{y_1(0)y_2'(0) - y_1'(0)y_2(0)}$,	$\alpha_2 = \frac{y_1y_1(0) - y_0y_1'(0)}{y_1(0)y_2'(0) - y_1'(0)y_2(0)}$	(15)

Results are summarized in the table below:

![image-20231204164737237](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231204164737237.png)

Transfer function: The ratio of the forced response to the input in the $s$-domain.

- For a differential equation $ay'' + by' + cy = g(t)$,  with constants $a$, $b$, $c$, the transfer function is 

  $H = \frac{1}{as^2 + bs + c}$

Impulse response: The $s$-domain forced response $H(s)G(s)$ reduces to the transfer function $H(s)$ when $G(s) = 1$. This means that the corresponding input in the $t-domain$ is $g(t) = \delta(t)$ since $\mathcal{L}\{\delta(t)\} = 1$. As such, the *inverse Laplace transform* of the transfer function, $h(t) = \mathcal{L}^{-1}\{H(s)\}$, is the solution to the IVP

$ay'' +by' + cy = \delta(t)$	$y(0) = 0$	$y'(0) = 0$	(16)

obtained from (13) by replacing $g$ with $\delta$. Thus, $h(t)$ is the response of the system to a unit impulse applied at $t = 0$ if all initial conditions are set to 0. It is natural, therefore, to call $h(t)$ the **impulse response** of the system.

- The **forced response** in the $t$-domain is the convolution of the impulse response and the forcing function.

In summary, to obtain the system output in the t-domain:

![image-20231204175820966](C:\Users\Justin\AppData\Roaming\Typora\typora-user-images\image-20231204175820966.png)

**10.1 Orthogonal Systems in the Space** $PC[a, b]$

Not covered in the class

**10.2 Fourier Series**

Not covered in the class

**10.3 Elementary Two-Point Boundary Value Problems**

Not covered in the class

**11.1 Heat Conduction in a Rod: Homogeneous Case**

Not covered in the class