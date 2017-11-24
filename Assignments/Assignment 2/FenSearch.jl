function FenSearch(FT::Nullable{FTree}, x::Float64)
    if isnull(get(FT).left) == true && isnull(get(FT).right) == true
      return get(FT).data
  elseif x < get(get(FT).left).data.value
      FT = get(FT).left
      FenSearch(FT,x)
  elseif x > get(get(FT).left).data.value
      xleft = get(get(FT).left).data.value
      FT = get(FT).right
      FenSearch(FT, x-xleft)
    end
end
