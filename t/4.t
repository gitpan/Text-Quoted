#!/usr/bin/perl
# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 1;
use Text::Quoted;

# I don't really care what the results are, so long as we don't
# segfault.

my $ntk = <<NTK;
 _   _ _____ _  __ <*the* weekly high-tech sarcastic update for the uk>
| \ | |_   _| |/ / _ __   __2002-07-26_ o join! mail an empty message to
|  \| | | | | ' / | '_ \ / _ \ \ /\ / / o ntknow-subscribe@lists.ntk.net
| |\  | | | | . \ | | | | (_) \ v  v /  o website (+ archive) lives at:
|_| \_| |_| |_|\_\|_| |_|\___/ \_/\_/   o     http://www.ntk.net/ 
NTK

$expected = [
  {
    'quoter' => '',
    'text' => '_   _ _____ _  __ <*the* weekly high-tech sarcastic update for the uk>',
    'raw' => ' _   _ _____ _  __ <*the* weekly high-tech sarcastic update for the uk>',
    'empty' => ''
  },
  [
    [
      {
        'quoter' => '|  | |',
        'text' => '_   _| |/ / _ __   __2002-07-26_ o join! mail an empty message to',
        'raw' => '|  | |_   _| |/ / _ __   __2002-07-26_ o join! mail an empty message to',
        'empty' => ''
      },
      [
        {
          'quoter' => '|  | | | | |',
          'text' => '\' / | \'_  / _   / / / o ntknow-subscribe.ntk.net',
          'raw' => '|  | | | | | \' / | \'_  / _   / / / o ntknow-subscribe.ntk.net',
          'empty' => ''
        }
      ]
    ],
    [
      {
        'quoter' => '| |  | | | |',
        'text' => '. | | | | (_)  v  v /  o website (+ archive) lives at:',
        'raw' => '| |  | | | | .  | | | | (_)  v  v /  o website (+ archive) lives at:',
        'empty' => 0
      }
    ],
    {
      'quoter' => '|',
      'text' => '_| _| |_| |_|_|_| |_|___/ _/_/   o     http://www.ntk.net/',
      'raw' => '|_| _| |_| |_|_|_| |_|___/ _/_/   o     http://www.ntk.net/ ',
      'empty' => ''
    }
  ]
];

#use Data::Dumper;print Dumper(extract($ntk));
is_deeply(extract($ntk), $expected, "It's not pretty, but at least it works");
