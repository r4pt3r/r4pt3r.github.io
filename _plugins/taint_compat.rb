# Compatibility shim for Ruby 3.4+ where taint APIs were removed but are still
# called by Liquid/Jekyll.
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end
  end
end

unless Object.method_defined?(:untaint)
  class Object
    def untaint
      self
    end
  end
end
