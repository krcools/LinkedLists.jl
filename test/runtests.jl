using LinkedLists
using Test

ll = LinkedList(["apple", "pear", "banana"])
state = start(ll)
insert!(ll, state, "kiwi")

@test first(ll) == "kiwi"
end
