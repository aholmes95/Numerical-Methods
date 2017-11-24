function q2search(list::Nullable{LList}, x::Float64)
    if isnull(list) == true
      return Nullable{KVPair}
  elseif x < get(list).data.value
      return get(list).data
    else
      list = get(list).next
      q2search(list, x)
    end
end
