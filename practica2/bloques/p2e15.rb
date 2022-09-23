
def da_nil?
    yield
end

p da_nil? {}
p da_nil? { 'Algo distinto de nil' }