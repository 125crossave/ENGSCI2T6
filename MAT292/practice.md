<h1>MAT292 practice</h1>

<h3>Modelling physical situations</h3>

***Pendulums***

*Equation of Motion* (Diprima 1.1 #29-30)

#29:

Follow the steps indicated here to derive the equation of motion of a pendulum, Eq. (12) in the text. Assume that the rod is rigid and weightless, that the mass is a point mass, and that there is no friction or drag anywhere in the system.

(a) Assume that the mass is in an arbitrary displaced position, indicated by the angle θ. Draw a free-body diagram showing the forces acting on the mass.

(b) Apply Newton’s law of motion in the direction tangential to the circular arc on which the mass moves. Then the tensile force in the rod does not enter the equation. Observe that you need to find the component of the gravitational force in the tangential direction. Observe also that the linear acceleration, as opposed to the angular acceleration, is $L \frac{d^2t}{dt^2}$, where $L$ is the length of the rod.

- Gravity = linear/vertical acceleration = $mg$ = $mL \frac{d^2t}{dt^2}$
- Tangential acceleration = $mg\sin{\theta}$
- Set Vertical + tangential (in other words, the total acceleration) to 0

(c) Simplify the result from part (b) to obtain Eq. (12) in the text.

- $0 = mL\frac{d^2t}{dt^2}$ + $mg\sin{\theta}$
- Divide both sides by $mL$: $0 = \frac{d^2t}{dt^2} + \frac{g}{L}\sin{\theta}$

#30:

Another way to derive the pendulum equation (12) is based on the principle of conservation of energy.

(a) Show that the kinetic energy $K$ of the pendulum in motion is $K = \frac{1}{2}mL^2\Big(\frac{d^2\theta}{dt^2}\Big)$

- $K$ = $\frac{1}{2}mv^2$ and $v$ = $L \frac{d\theta}{dt}$

- Plug $v$ in to get $\frac{1}{2}mL^2\Big(\frac{d^2\theta}{dt^2}\Big)$

(b) Show that the potential energy $U$ of the pendulum, relative to its rest position, is $U = mgL(1 - \cos{\theta})$

- $U = mgh$ and $h = mgL - mgL\cos{\theta}$

(c) By the principle of conservation of energy, the total energy $E = K + U$ is constant. Calculate $\frac{dE}{dt}$, set it equal to zero, and show that the resulting equation reduces to Eq. (12).

- $E = \frac{1}{2}mL^2\Big(\frac{d^2\theta}{dt^2}\Big) + mgL(1 - \cos{\theta})$
- By chain rule, $\frac{dE}{dt} = \frac{1}{2}mL^2\Big(\frac{d^2\theta}{dt^2}\Big)2\frac{d\theta}{dt} + mgL\sin{\theta}\frac{d\theta}{dt}$

- Set LHs equal to 0 and divide both sides by $\frac{d\theta}{dt}$ and $mL^2$

<h3>Constructing equations to meet requirements</h3>

*Diprima 2.1 #34-37*

In each of Problems 34 through 37 construct a first order linear differential equation whose solutions have the required behavior as t → ∞. Then solve your equation and confirm that the solutions do indeed have the specified property.

34. All solutions have the limit 3 as t → ∞.
    - $y' + y = 3$
    - IF = $e^t$
    - $(e^t y)' = 3e^t$
    - $e^t y = 3e^t + c$
    - $y = 3 + \frac{c}{e^t}$ is the general solution and for any choice of $c$, $y$ will approach 3 as $t \longrightarrow \infty$ 
35. All solutions are asymptotic to the line y = 3 − t as t → ∞
    - $y' + y = 2 - t$
    - IF = $e^t$
    - $(e^t y)'$ = $2e^t - te^t$
    - $e^t y = 2e^t - te^t + e^t + c$
    - $y = 3 - t + \frac{c}{e^t}$ is the general solution
36. All solutions are asymptotic to the line y = 2t − 5 as t → ∞.
    - $y' + y = 2t - 3$
    - IF = $e^t$
    - $(e^ty)' = 2te^t - 3e^t$
    - $e^t y = 2(te^t - e^t) - 3e^t + c$
    - $y = 2t - 5 + \frac{c}{e^t}$ is the general solution
37. All solutions approach the curve y = 4 − t^2 as t → ∞.
    - $y' + y = 6 - t^2 + 2t$
    - IF = $e^t$
    - $(e^t y)' = 6e^t - t^2e^t + 2te^t$
    - $e^t y = 6e^t - (2te^t + t^2e^t) + 2(te^t - e^t) + c$
    - $y = 6 - 2t + t^2 + 2t -2 + \frac{c}{e^t}= 4 - t^2 + \frac{c}{e^t}$ is the general solution

<h3>Motivation for important methods</h3>

***Method of Undetermined Coefficients*** (Diprima 1.2, #5)

Here is an alternative way to solve the equation $y' = ay - b$ (i):

(a) Solve the simpler equation $\frac{dy}{dt} = ay$ (ii). Call the solution $y_1(t)$.

- $\ln{|y_1|} = at + c$
- $y_1 = Ce^{at}$ is the general solution

(b) Observe that the only difference between Eqs. (i) and (ii) is the constant −b in Eq. (i). Therefore it may seem reasonable to assume that the solutions of these two equations also differ only by a constant. Test this assumption by trying to find a constant k such that y = y1(t) + k is a solution of Eq. (i).

- $a(Ce^{at} + k) - b = \frac{d(Ce^{at} + k)}{dt} = aCe^{at}$
- Simplifying, $ak - b = 0$
- Therefore, $k = \frac{b}{a}$

***Variation of Parameters***