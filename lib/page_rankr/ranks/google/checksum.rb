module PageRankr
  class Ranks
    class Google < Rank
      class Checksum
        class << self
          def generate(site)
            bytes  = byte_array('info:' + site)
            length = bytes.length
            a = b = 0x9E3779B9
            c = 0xE6359A60
            k, len = 0, length
            while(len >= 12)
              a = m(a + bytes[k + 0] + (bytes[k + 1] << 8) + (bytes[k +  2] << 16) + (bytes[k +  3] << 24))
              b = m(b + bytes[k + 4] + (bytes[k + 5] << 8) + (bytes[k +  6] << 16) + (bytes[k +  7] << 24))
              c = m(c + bytes[k + 8] + (bytes[k + 9] << 8) + (bytes[k + 10] << 16) + (bytes[k + 11] << 24))

              a, b, c = mix(a, b, c)
              k += 12
              len -= 12
            end

            c = c + length

            c = mix(*toss(a, b, c, bytes, len, k))[2]
            "6" + c.to_s
          end

          private

          def byte_array(site)
            bytes = []
            site.each_byte {|b| bytes << b}
            bytes
          end

          # Need to keep numbers in the unsigned int 32 range
          def m(v)
            v % 0x100000000
          end

          def mix(a, b, c)
            a, b, c = m(a), m(b), m(c)

            a = m(a-b-c) ^ m(c >> 13)
            b = m(b-c-a) ^ m(a << 8)
            c = m(c-a-b) ^ m(b >> 13)

            a = m(a-b-c) ^ m(c >> 12)
            b = m(b-c-a) ^ m(a << 16)
            c = m(c-a-b) ^ m(b >> 5)

            a = m(a-b-c) ^ m(c >> 3)
            b = m(b-c-a) ^ m(a << 10)
            c = m(c-a-b) ^ m(b >> 15)

            [a, b, c]
          end

          def toss(a, b, c, bytes, len, k)
            case len
              when 9..11
                c = c + (bytes[k+len-1] << ((len % 8) * 8))
              when 5..8
                b = b + (bytes[k+len-1] << ((len % 5) * 8))
              when 1..4
                a = a + (bytes[k+len-1] << ((len - 1) * 8))
              else
                return [a, b, c]
            end
            toss(a, b, c, bytes, len-1, k)
          end
        end
      end
    end
  end
end