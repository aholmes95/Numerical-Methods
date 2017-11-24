function mergeSort(A::Array{Int64, 1})
    n = Int(length(A))
    if n == 1
        return A
    else
        m = n / 2
        m = Int(m)
        return mergepresorted(mergeSort(A[1:m]), mergeSort(A[m + 1:n]))
    end
end
