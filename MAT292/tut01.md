<h3>MAT292: Tutorial 1</h3>

1. ***Setting up and solving the IVP**. We’d like a mathematical model of the intensity of an X-ray beam fired in a straight line into uniform matter with linear absorption coefficient 𝐴*

(a) *Use your knowledge of exponential decay to find an ordinary differential equation (ODE) to describe this situation, including a variable for the initial condition. An IVP for this situation is given by?*

- Let $I(x)$ be the intensity of the x-ray as a function of $x$; then, we have
- $\frac{dI}{dx} = -AI$ as the rate of change of the intensity

(b) *Classify this ODE*

- Separable

(c) *We have seen the solution to IVPs like this. The solution is given by 𝐼 (𝑥 ) =*

- $I = I_0e^{-Ax}$ where $I_0$ is the initial value of $I$ 

(d) *Of the following, identify all that could possibly be units for 𝐴: keV/cm? 1/cm? 1/m?
Justify your choice.*

- The rate of change of $I$ should be in $keV/L$, and since $I$ is measured in keV we see that units of $A$ must be $\frac{1}{L}$, which means 1/cm and 1/m are possible

2. ***Computing the absorption coefficient**. In order to understand CT scanning, you will need to know the linear absorption coefficient of healthy human tissue*

(a) *Give a brief explanation of how to use our solution to find how far through a material an X-ray beam can travel before its intensity has fallen to 1/𝑒 times its original intensity*

- $\frac{1}{e} = e^{-Ax}$
- $-1 = (-Ax)$
- $\frac{1}{A} = x$

(b) *You fire an X-ray through some healthy tissue of thickness $x_1$, and you measure $I_1$ keV on your X-ray detector. When you fire the same X-ray through some healthy tissue of thickness $x_2$ you measure $I_2$ keV. Use your model to find a formula for the linear absorption coefficient of healthy tissue.*

- $I_1$ = $I_0e^{-Ax_1}$
- $I_2 = I_0e^{-Ax_2}$
- $\frac{I_1}{I_2} = \frac{I_0e^{-Ax_1}}{I_0e^{-Ax_2}} = e^{-Ax_1}e^{Ax_2} = e^{-A(x_1 + x_2)}$
- $\ln{\frac{I_1}{I_2}} = -A(x_1 + x_2)$
- $\frac{\ln{\frac{I_1}{I_2}}}{x_2 - x_1} = A$

(c) *You fire an X-ray through two uniform layers of material. One layer has thickness $x_1$ and linear absorption coefficient $A_1$, and the second layer has thickness $x_2$ and linear absorption coefficient $A_2$. Use your model to find a formula for the intensity of the beam after it has passed through both layers.*

- $I_1 = I_0e^{-Ax_1}$
- $I_2 = I_1e^{-Ax_2} = I_0e^{-Ax_1}e^{-Ax_2}$

3. **Locating abnormalities**. Now you will explore X-ray Computed Tomography (CT), used in medical imaging. We want to use our model to find and describe regions of unhealthy tissue.

(a) *You fire a 15 keV X-ray through two layers of material, with a combined thickness of 5 cm, and you measure $\frac{15}{e}$ keV on your X-ray detector. The layers have linear absorption coefficients $A_1$ and $A_2$, respectively. Find the thickness $x_1$ of the first layer, and the thickness $x_2$ of the second layer. The expressions should only depend on $A_1$ and $A_2$ (or a combination thereof)*

- $I_F = I_0e^{-A_1x_1 - A_2x_2}$
- $e^{-1} = e^{-A_1x_1} e^{-A_2x_2}$
- $1 = A_1x_1 + A_2x_2$
- $5 = x_1 + x_2$
- Solving, we get $x_1 = \frac{1 + 5A_2}{A_1A_2}$ and $x_2 = \frac{5A_1 - 1}{A_1A_2}$

