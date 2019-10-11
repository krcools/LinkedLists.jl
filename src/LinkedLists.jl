module LinkedLists

export LinkedList
export start, next, done

struct Node{T}
    data::T
    next::Int
end

mutable struct LinkedList{T}
    nodes::Vector{Node{T}}
    head::Int
end

"""
    LinkedList(collection)

Creates a new linked list from an iterable collection.
"""
function LinkedList(els::Vector)
    nodes = [Node(el,i+1) for (i,el) in enumerate(els)]
    nodes[end] = Node(last(els),0)
    LinkedList(nodes,1)
end

start(ll::LinkedList) = (0, ll.head)
done(ll::LinkedList, state) = state[2] < 1
next(ll::LinkedList, (prev, next)) = ll.nodes[next].data, (next, ll.nodes[next].next)

function Base.iterate(ll::LinkedList, state=start(ll))
    done(ll, state) ? nothing : next(ll, state)
end

function Base.insert!(ll::LinkedList, pos, item)
    prev, next = pos
    push!(ll.nodes, Node(item, next))
    prev > 0 && (ll.nodes[prev] = Node(ll.nodes[prev].data, lastindex(ll.nodes)))
    if next == ll.head
        ll.head = lastindex(ll.nodes)
    end
    return ll
end

end # module
