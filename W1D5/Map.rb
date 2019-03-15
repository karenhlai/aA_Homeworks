class Map
    def initialize(set)
        @set = set
    end

    def set(key, value)
        pair_idx = set.index { |pair| pair[0] = key }
        if pair_idx
            set[pair_idx][1] = value
        else 
            set << [key, value]
        end
        value
    end

    def get(key)
        set.each { |pair| return pair[1] if pair[0] == key }
    end

    def delete(key)
        val = get(key)
        set.reject! { |pair| pair[0] == key }
        val
    end

    def show
        set.deep_dup
    end

    private
    attr_reader :set
    def deep_dup
        set.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end
end