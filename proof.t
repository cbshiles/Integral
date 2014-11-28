integral of (x^3 * (x+3)^1/2)
 
dv = (x+3)^1/2 
chain rule in reverse:
f' = z^1/2 f = 2/3 z^3/2 g' = 1 g = x+3
v = 2/3(x+3)^3/2

u = x^3
du = 3x^2

intgrl(u*dv) = uv - intgrl(du*v)
2/3 x^3(x+3)^3/2 - intgrl(2 x^2(x+3)^3/2)

-2* integral(x^2(x+3)^3/2)

dv = (x+3)^3/2
v = 2/5 (x+3)^5/2

u = x^2
du = 2x

intgrl(u*dv) = uv - intgrl(du*v)

-2* integral(x^2(x+3)^3/2)
-2*(2/5 x^2(x+3)^5/2 - intgrl(4/5 x*(x+3)^5/2))



8/5 * intgrl(x*(x+3)^5/2)
dv = x v = X^2/2
u = (X+3)^5/2 du = 2/7 (X+3)^3/2

intgrl(u*dv) = uv - intgrl(du*v)
8/5 * (1/2 x^2(x+3)^5/2 - intgrl(1/7 X^2(x+3)^3/2))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

-2* integral(x^2(x+3)^3/2)

dv = x^2
v = 1/3 X^3

u = (x+3)^3/2
du = 3/2 (x+3)^1/2

-2 * intgrl(u*dv) = -2 * (uv - intgrl(du*v))
-2*(1/3 x^3(x+3)^3/2 - intgrl(1/2 x^3(x+3)^3/2))
Which is exactly where i started