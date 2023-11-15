require "colorize"

# 0                   1                   2                   3
# 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |          Source Port          |       Destination Port        |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |                        Sequence Number                        |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |                    Acknowledgment Number                      |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |  Data |           |U|A|P|R|S|F|                               |
# | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
# |       |           |G|K|H|T|N|N|                               |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |           Checksum            |         Urgent Pointer        |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |                    Options                    |    Padding    |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |                             data                              |
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

DATAGRAM = 0xa8a822b8be9aa3997d6589dc8018010077d700000101080a553acda440cb9fac68656c6c6f0a
puts "Raw Data: #{DATAGRAM.to_s(16).green}"

DATAGRAM_SIZE = DATAGRAM.bit_length


IP_SRC = (DATAGRAM >> (DATAGRAM_SIZE - (32 * 1) + 16)) # first 16 bits
IP_DST =  (DATAGRAM >> (DATAGRAM_SIZE - (32 * 1))) & 0xFFFF # last 16 bits
SEQ_NUM = (DATAGRAM >> (DATAGRAM_SIZE - (32 * 2))) & 0xFFFFFFFF
ACK_NUM = (DATAGRAM >> (DATAGRAM_SIZE - (32 * 3))) & 0xFFFFFFFF
WINDOW =(DATAGRAM >> (DATAGRAM_SIZE - (32 * 4))) & 0xFFFF
CHECKSUM = (DATAGRAM >> (DATAGRAM_SIZE - (32 * 5) + 16)) & 0xFFFF
URGENT = (DATAGRAM >> (DATAGRAM_SIZE - (32 * 5))) & 0xFFFF
# OPTIONS = (DATAGRAM >> (DATAGRAM_SIZE - (32 * 6))) & 0xFFFFFFFF

puts "IP SRC: #{IP_SRC.to_i.to_s.yellow.bold}"
puts "IP DST: #{IP_DST.to_i.to_s.yellow.bold}"
puts "SEQ NUM: #{SEQ_NUM.to_i.to_s.yellow.bold}"
puts "ACK NUM: #{ACK_NUM.to_i.to_s.yellow.bold}"
puts "WINDOW SIZE: #{WINDOW.to_i.to_s.yellow.bold}"
puts "CHECKSUM: #{CHECKSUM.to_i.to_s.yellow.bold}"
puts "URGENT: #{URGENT.to_i.to_s.yellow.bold}"

