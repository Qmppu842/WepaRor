json.array!(@raitings) do |rating|
  json.extract! rating, :id, :score
end
