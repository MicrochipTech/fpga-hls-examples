#ifndef __MERGESORT_FOR_SPLIT_MULT_HPP__
#define __MERGESORT_FOR_SPLIT_MULT_HPP__

// We use template metaprogramming to compute the order in which to do the
// additions in split_mult. We consider the pairs of indices (i, j) where i
// tells us the split in the first input and j tells us the split in the second
// input. When multiplying these numbers, we would have to add some zeros to the
// end of the result for it to be correctly lined up in the full result. We call
// this number of zeros the scale. The scale is i * MULT_W_A + j * MULT_W_B,
// where MULT_W_A and MULT_W_B are the widths of the splits of the inputs A and
// B. We have to do the additions in increasing order of scale. The structs here
// provide the ability to compute the list of all pairs of indices, and to sort
// that list on the scale.

// struct to represent a linked list, with data fields i and j, and typedef
// next as the next pointer of the list. The get_every_i and get_every_j
// functions are used to store every i and j from the list in the current order
// of the list, into the array provided.
template <unsigned ii, unsigned jj, typename N> struct list {
    typedef N next;
    static const unsigned i = ii;
    static const unsigned j = jj;

    static void get_every_i(unsigned *arr) {
        arr[0] = i;
        next::get_every_i(arr + 1);
    }

    static void get_every_j(unsigned *arr) {
        arr[0] = j;
        next::get_every_j(arr + 1);
    }
};

// struct to represent the end of the list, with terminator implementations of
// get_every_i and get_every_j.
struct end {
    static void get_every_i(unsigned *arr) {}
    static void get_every_j(unsigned *arr) {}
};

// struct to create the list of all pairs of indices. m_i and m_j are the max
// values of i and j. This should first be called with (i, j) = (0, 0). The
// resultant list is available from the member type 'node'.
template <unsigned i, unsigned j, unsigned m_i, unsigned m_j, typename = void>
struct create_list;

// This version of the struct is used if i < m_i. It adds (i, j) to the current
// position of the list, and recursively calls create_list<i+1, j, m_i, m_j> for
// the 'next' portion of the list.
template <unsigned i, unsigned j, unsigned m_i, unsigned m_j>
struct create_list<i, j, m_i, m_j, typename std::enable_if<(i < m_i)>::type> {
    typedef list<i, j, typename create_list<i + 1, j, m_i, m_j>::node> node;
};

// This version of the struct is used if i == m_i and j < m_j. It adds (i, j)
// to the current position of the list, and recursively calls
// create_list<0, j+1, m_i, m_j> for the 'next' portion of the list.
template <unsigned i, unsigned j, unsigned m_i, unsigned m_j>
struct create_list<i, j, m_i, m_j,
                   typename std::enable_if<(i == m_i && j < m_j)>::type> {
    typedef list<i, j, typename create_list<0, j + 1, m_i, m_j>::node> node;
};

// This version of the struct is used if i == m_i and j == m_j. It adds (i, j)
// to the current position of the list, and uses end for the 'next' portion of
// the list (this is the last element of the list).
template <unsigned i, unsigned j, unsigned m_i, unsigned m_j>
struct create_list<i, j, m_i, m_j,
                   typename std::enable_if<(i == m_i && j == m_j)>::type> {
    typedef list<i, j, end> node;
};

// The following structs are used to perform mergesort on the list, where we
// sort in increasing order of the scale (i * mult_i + j * mult_j).

// A struct to perform the merge operation. This assumes that L and R are lists
// that are already in sorted order. The resultant list is available from the
// member type 'merged'.
template <typename L, typename R, unsigned mult_i, unsigned mult_j,
          typename = void>
struct merge;

// This version of the merge struct is used if both lists are non-empty and the
// first element from L belongs before the first element from R. It adds the
// first element from L to the current position of the resultant list and
// recursively calls merge with the next field of L and with R for the 'next'
// portion of the resultant list.
template <unsigned il, unsigned jl, typename Nl, unsigned ir, unsigned jr,
          typename Nr, unsigned mult_i, unsigned mult_j>
struct merge<list<il, jl, Nl>, list<ir, jr, Nr>, mult_i, mult_j,
             typename std::enable_if<(il * mult_i + jl * mult_j <
                                      ir * mult_i + jr * mult_j)>::type> {
    typedef list<il, jl, typename merge<Nl, list<ir, jr, Nr>, mult_i,
                                        mult_j>::merged> merged;
};

// This version of the merge struct is used if both lists are non-empty and the
// first element from R belongs before the first element from L. It adds the
// first element from R to the current position of the resultant list and
// recursively calls merge with L and the next field of R for the 'next'
// portion of the resultant list.
template <unsigned il, unsigned jl, typename Nl, unsigned ir, unsigned jr,
          typename Nr, unsigned mult_i, unsigned mult_j>
struct merge<list<il, jl, Nl>, list<ir, jr, Nr>, mult_i, mult_j,
             typename std::enable_if<(il * mult_i + jl * mult_j >=
                                      ir * mult_i + jr * mult_j)>::type> {
    typedef list<ir, jr, typename merge<Nr, list<il, jl, Nl>, mult_i,
                                        mult_j>::merged> merged;
};

// This version of the merge struct is used if R is empty. It sets the resultant
// list to L.
template <typename L, unsigned mult_i, unsigned mult_j>
struct merge<L, end, mult_i, mult_j> {
    typedef L merged;
};

// This version of the merge struct is used if L is empty. It sets the resultant
// list to R.
template <typename R, unsigned mult_i, unsigned mult_j>
struct merge<end, R, mult_i, mult_j> {
    typedef R merged;
};

// A struct to get a list containing the first n elements from the list L. The
// resultant list is available from the member type 'first_n'.
template <unsigned n, typename L> struct get_first_n;

// This version of the get_first_n struct is used if n is non-zero. It adds the
// first element of the list to the current position of the resultant list, and
// recursively calls get_first_n with n-1 and the next portion of the input
// list for the 'next' portion of the resultant list.
template <unsigned n, unsigned i, unsigned j, typename N>
struct get_first_n<n, list<i, j, N>> {
    typedef list<i, j, typename get_first_n<n - 1, N>::first_n> first_n;
};

// This version of the get_first_n struct is used if n == 0 and the input list
// is non-empty. It sets the resultant list to end (an empty list).
template <unsigned i, unsigned j, typename N>
struct get_first_n<0, list<i, j, N>> {
    typedef end first_n;
};

// This version of the get_first_n struct is used if n == 0 and the input list
// is empty. It sets the resultant list to end (an empty list).
template <typename L> struct get_first_n<0, L> { typedef end first_n; };

// A struct to get a list excluding the first n elements from the input list L.
// The resultant list is available from the member type 'remaining'. This
// assumes that there are at least n elements in the list.
template <unsigned n, typename L> struct skip_first_n;

// This version of the skip_first_n struct is used if n is non-zero. It
// recursively calls skip_first_n with n-1 and the next portion of the input
// list.
template <unsigned n, unsigned i, unsigned j, typename N>
struct skip_first_n<n, list<i, j, N>> {
    typedef typename skip_first_n<n - 1, N>::remaining remaining;
};

// This version of the skip_first_n struct is used if n == 0 and the input list
// is non-empty. It sets the resultant list to the input list.
template <unsigned i, unsigned j, typename N>
struct skip_first_n<0, list<i, j, N>> {
    typedef list<i, j, N> remaining;
};

// This version of the skip_first_n struct is used if n == 0 and the input list
// is empty. It sets the resultant list to the input list.
template <typename L> struct skip_first_n<0, L> { typedef L remaining; };

// A struct to perform mergesort on the input list L that contains exactly num
// elements, where mult_i and mult_j are used for the scale calculation. The
// resultant list is available from the member type 'sorted'.

// This version of the mergesort struct is used if num > 1. It splits the input
// list in two, recursively calls mergesort on each half, and then merges the
// two sorted halves.
template <unsigned num, typename L, unsigned mult_i, unsigned mult_j>
struct mergesort {
    typedef typename merge<
        typename mergesort<num / 2, typename get_first_n<num / 2, L>::first_n,
                           mult_i, mult_j>::sorted,
        typename mergesort<num - num / 2,
                           typename skip_first_n<num / 2, L>::remaining, mult_i,
                           mult_j>::sorted,
        mult_i, mult_j>::merged sorted;
};

// This version of the mergesort struct is used if num == 0. It sets the
// resultant list to end (an empty list).
template <unsigned mult_i, unsigned mult_j>
struct mergesort<0, end, mult_i, mult_j> {
    typedef end sorted;
};

// This version of the mergesort struct is used if num == 1. It sets the
// resultant list to the input list.
template <typename L, unsigned mult_i, unsigned mult_j>
struct mergesort<1, L, mult_i, mult_j> {
    typedef L sorted;
};

#endif
