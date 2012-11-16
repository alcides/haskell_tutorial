double integral(double (*f)(double x), double a, double b)
{
    double  sum, dt;
    int     i;
 
    // Numerical integration: 0th order approximation
    sum = 0.0;
    dt = (b - a) / 100.0;
    for (i = 0;  i < 100;  i++)
        sum += (*f)(i * dt + a) * dt;
 
    return sum;
}