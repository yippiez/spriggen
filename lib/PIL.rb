require 'pycall/import'
include PyCall::Import

module PIL
    pyfrom :PIL, import: :Image
    pyimport :numpy, as: :np

    def from_array_to_PIL_image(array)
        n = np.array(array)
        Image.fromarray(n.astype(np.uint8), 'RGB')
    end

    def from_PIL_to_array(image)
        np.array(image)
    end

    def read_PIL_image(path)
        Image.open(path)
    end
    
    def save_PIL_image(image, path)
        image.save(path, 'PNG')
    end
end

