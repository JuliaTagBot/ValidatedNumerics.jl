
doc"""
    bisection(f, X; tolerance=1e-3)

Find possible roots of the function `f` inside the `Interval` or `IntervalBox` `X`.
"""
function bisection{T}(f, X::T; tolerance=1e-3, debug=false)

    image = f(X)

    debug && @show X, image

    if !(zero(X) ⊆ image)
        return Root{T}[]
    end

    if diam(X) < tolerance
        return [Root(X, :unknown)]
    end

    X1, X2 = bisect(X)

    if debug
        @show X1, X2
    end

    return [bisection(f, X1, tolerance=tolerance);
            bisection(f, X2, tolerance=tolerance)]

end
