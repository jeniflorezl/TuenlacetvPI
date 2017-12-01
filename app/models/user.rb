class User < ApplicationRecord
    validates :login, :nombre, :usuario, presence: true #obligatorio
end
