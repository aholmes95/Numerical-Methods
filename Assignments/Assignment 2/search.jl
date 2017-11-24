function search(list::Nullable{LList}, k::Int64)
    if isnull(list) == true
      return Nullable{KVPair}
    elseif get(list).data.key == k
      return get(list).data
    else
      list = get(list).next
      search(list, k)
    end
end
