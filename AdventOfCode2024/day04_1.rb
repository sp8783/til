words = DATA.read.split("\n")
words.map!(&:chars)
h = words.size
w = words[0].size

hash = {
  0 => "X",
  1 => "M",
  2 => "A",
  3 => "S"
}
dxy = [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]
ans = 0

h.times do |i|
  w.times do |j|
    dxy.each do |dx, dy|
      flag = true
      4.times do |k|
        if i + k * dx < 0 || i + k * dx >= h || j + k * dy < 0 || j + k * dy >= w || words[i + k * dx][j + k * dy] != hash[k]
          flag = false
          break
        end
      end
      ans += 1 if flag
    end
  end
end

puts ans

__END__
MMSSMSMXAMXMSSSSMMXSSMSAMASASXXAAXMAXXAMXAXSXMAMXMMMMSSMXMAAAMXMMMXXAMMAMSAMXXAMMMAAMMMSMMMMMXXSAMXMASXMXSMSXMXMMMSMSAMXSSMMXMMASMSMSMMMAMMS
AASAAAXMSMMAMAXAASMMAAMASXMMSASMSSXASAMXXAXMASAXXMMMAAAXMAMXMSAMSMSSMSMAMMMMSMAMASMMSXMAXXAASXAXAMXMASAMMSAMXMXMAAAXMASXMAMSAXXMSAAAAAASASXS
MXSMMMMAAMAAMXMSMMASMMMAMAAAMAMAAMMAXAMXSSXSAMSMSAMMMSSSMSXMAMAMXMAAXXMMSMAAASAMXSXASMSMSXSMSAMSXMAXASAMAMAMXMASMSXXSAMMSSMSAMSASMMSMSMSASAS
MMMASXSSMXSASXAXASMMAXMMSSMMMXMMMMSSSMSMMAAXXMAXXAMXMMXAAXAXASXMAMSXMSAMXMMSXSXSXMMXMAMXMAMMXAMAMMSMASMMASXMSSXSAMAAMAMMAMXMAAMAMMXXXXXMAMAX
SASXMAAXXMMAMXMMAMXSXMMMXASMMMMXSAAAAAAXMMMMMMXXMAMXMMSMMMSMXAXXXMAASAMXASXMAXXAMXASMSMAMXMASMMXSAAMXMASASAMAMAMAMMXAAMMAMXMMMMMXSAMASMMXMXM
SXSAMXMXMSMAMAMSAMXMXXAASAMXXASAMMSMMXMSMAMAMMASXSSMAAAAAAXMMMMXSMMMSAMMMMAMAMSMSMMSAMMMSSMAMXAXMMMSMSXMASXMASAMAXXAXAXSASAXAXXAAXAMAMAMAMAA
SASXSASAAASMSMMAAMXMSXMMXASXSSMXXAMXSMMXMASMXMXSAAMMMXXSMSXSAASMMSMASAMAAXMMAXXXAAXMXMASAAMAXMMSAMMAAXAMXMMSAXXXSXSAMSMSASXSASMMSSXMASAMAXXX
MAMXSASMSMSMAXMSSMXXMASMSXMASXMSMXSAXAAMMXSXXSMMMMMSMSAMXMASMXMAAXXAMAMSMSXSMSMSSSMSMSXSSSMXSASMASMSMSSMXMAMMSXMXAMXXMASMMAMAXXXAMXXXSXSSSSS
MAMMMAMXAXXMAXXAMXMASAMAASMSMAXXAAMMMMMSMAMXAMAXMMAAAMAMAMAMMSSMMMMSMSMAMSAMAAAXAMXAASAMAXXMAXXMAMXAMAAAMAXXMAXAMXMASMAMMMAMMMSMMSSSXXAXXAAA
SASXMAMSASAMXSMMXSMAMAMXMAXMSAMMMMMSASAMMAMSASXMSSMMMMAMXMSXAXXMASMXAMSSSMAMXMSMSMSMSMAMAMXAXMXMMSSMMSXMASXSSSMXSXXXXMAMXXAXAMXASAAMAMSMMMMM
SXXMMSMMASMMAMASAAMXXMMMXMAMAMXXMAASAXAXMAXAAAAAAAASMSSXSXXMSSMSXSAMMMAXAMXMSAMXAAXMMMAMMSMSASXSXAMXAAMSXXAMAAXAMMMMSSSSMSMSSXSMMMSMAAAXMASX
XMSSXMAMAMAXASAMSSMSXXSAAMXXAXXSXMMMASXMMSSMMMMMSSMMAXMASXMAMAAAXMAMXMASXMAMAMXXMSMAASASXAXMAXXMMMMMMXMXAMAMSMMXSAMAXAAXAAMMMASMXXMXXSSSMASM
MMAMASAMXSXMMMMXXXAMAASMXMMMMAMSAMXMMXMAXAMXXXXXMXAMXMMAMAMMMMAMSXASASASMSSSMMXSAXXSMSMMXSSMSSXSAXAASXMMXXAMMAMXAXSMMMMMMMSAMAMXMASXXMXAMASM
AMASMMMXMXAAXAXXAMAMMMXAXXAAAAASXMASAAMXMMMAMSASMSXMXXMASXMMSMMAMXAMAMAMAMXAAAMMAMAXAMAAAMXMXMAMSMXMSASAASMMMXMAMAXMSAMMSMSASMXXASAMXSXMMASX
MSASAASXSSSMMSSSXXAXMXMMXSSSSSXXMAMAMSMSMXMAXXAAAAXAMXSAMASAAAMSMSMMSMSMSSXSMXSMSMMMMMMMSSMSAMXMMSMAXAMMXMSASASMSMSXXAXSAASAMXSMXMAAMSAMMXSM
MMMSMMSAAMXMXMAMAXSMMXXSAMXAAXXMASXMAMAXMAMMMXSMSMXSAMMXSAMSMSMAAAXSXAXAXMAXSXMAMXXAAAXMXAMSMSMSAAMMMSMXMASMMASAAASASXMSMXMXMAXMAXAMXMAMAMMM
XMAMXAMMMMAMXMAMSMXASMSAMSSMMMAXAMXXAMSMSSSSSMAAXMAXXAAAMMMMXAMMSMSMMMMSMMSMAMMAMMSSSSSXSSMXMXAMMMXAXAAMMAMXMAMMMXMAAAXXMSMXMXSXAMSMSSMMMSAA
MMASMXSMMSASMSAMAAXAMXMAMAAAXSMMSSXMXXAAAAAAXAMSMMMSSMMMMXAXSMMMMMMXAMAXAMMAAAMASXXMAAMAMXMXMMSSXMSSSMXSMXSAMXSSMMSMSXMSMAMAMXXMMMXAXAXSASMS
XSASMSAMXSXAASMSMSMSMSSMMSSMMAAAMMXMSSMSMMMMMSXMASAAAXSSSMMXSAASMMSSXSASAMASMMSASMSMMXMASAMASMASXXAMAXXMAXSASXMMAMXAXXMASMSASASASXSSSMMMASAX
XMSSMAAXMSXMAMXAAAAXAMMSAXAMSSMMXMAXMAXXXMXAMXXSAMMSXMASMAMAXMMMAAAAXMXSXMAMMXMAXAXXMASASASASMAMMMMSAMXMXMSAMMASXMMMMAMAMXSMSAXSAAAAXXAAAMAS
ASAMXMXMAXAXMAXMSMSMXMAMXSAXAAXAASMSSSMMMAASMMMMMSXMAXXXSAMSSMXXXMMMMSMMXMMXSAMXMSMSAMMASXXASMASAAAMASXXMAMAMSMMMXMASXMAMMXAMAMMMMMMMXMAXXXA
MMMSXXAXMMAMXSMAAAAMAMXMASAMXMMSMSAAXAAXMAAAAAAAAXXMSMSMSXXAAXSSSMSXAXAMMSMAMAXXSXAMSSMAMXMAMXXXMXMSXMMMAMMSMSAMXMXXXMSSSMMMMAXAMXMASXSSMSXM
XSXAMMSMSAMSAMMXMMAXAXMSAMXAXXXAXMMMXSAMXSXXXMMMMMSAMAAAXMMSSMMAAAAMSXSAASMMSSMMAMSMAMMMSAMASXMSSSXMMAXAXSAXSXMXAAMMAXAAAXAXMXSMMAMXMXMAAASX
SAMXSAMAMAMSAXAXSSMXMMAMASMSSMSMXMAAAMAMAMASMSMSAAMAMSMMMAAMAXMAMMMSMMMMMMAAAAMSAMAMAMAAXMSASAAAAXAXXXMXXMAMAMXSASAMMMMSMSMMSAXMSMMAAAXMMMAX
SSMAMASMMAMMMMSMMASAAMSMXMXAAAAAAMMMMSAMSXMXAAAMMMMAMAAMSMMSAMMSXXXMXAASXSMMSXMMASAMMSMMSMMAMMMMSMMMSXSXMMSMMXMAXMMXMAXAAMAAMAMXAASMSMSXXXMM
XAMXXAXAMXXXSAXMSAMMXMXAAMMSMSXSMSSXMSMMXAMMMMMMMSSSSMSMAAMMMXXXXSMSSSMSAAXXXMSSMMAMMAMMAXSSSXMAMAXXAAMAMAAAXXMAXMMMXSSMSMMMSAXMAXXAAXAMXSXS
SSMSMSSMMSMMMAXAMXMSMXSSXSAXMXMAXAXAMXMASAMXXAXMXAXMAXAXSXMAMMMSMMAAMXAMMMMMAMAAAMMMSAXSAMXMAAMAXXMXMMSAMSSMMMSAMMAMXMAMXXSASXASMMMSMMXMASAS
MAAAAXAAAAASMSMSMAASXAXXAMMSMXASMSSMMMMMSAMXSMSMMMSASXXXMASXXAAXAMMMMMSMAXAAAMSSMMMAMXMMMSMSSMMSSMXMXXMAMAAXSAMASXSSXSAMMAMASAMXAXXMASXXAMAM
SMMMSSSMSSSMAXAAXSXSMMMSAMAAAXSXAXXXAMAMMMAAMXAXSXSAMXMMMMAASMXMAMXSAAASXSSSXMMMAAMSSSMXXAAMAXXMAXXASAMMMMSASMMXMAAAXSAMXAMXMMXSXMXSMMMMSMAM
XAAXXAAAAMAMXMSMXXMXAXXMASMXSMMMMMSMMMAMAMMSMMSXMXMAXXAAAAAMAAMSSMASMMMSXAAMXMMMMXSAAAASMMSSSMMSAMMMSAMXSSMASAMSMXMMMSAMSMSMXMASMMASAAXAAMAX
SSMSMMMMMMAMXAMMAMMMSAMSXMMXAAXMAAAASXMXMSAAMSMASXSMXMASXSSSMMXAAMXSASXXMMXMAMAAXMAMMMMMAXMMXAXMAMSASAMAMXMSMXMAAXAXAMAMXMAAAMXSAMASXMMSMSSM
XXMAXASXXSASMSSMMMSAAMAXMASXSMMSMXMSMASAAMMMXAXXMXAAAAMMAMAXXMMSSXAMMAXMAXSSMSSXSAAXXXXSXMMASMMAMXMASMMMSAMXAASAMXMMMMMMXSXSMSXSMMXSAXMXMAMA
MMSAMMSAAXAMAMXAAAMASXSXMXMMXMASAXSAXAMMSMAMXASMMSXSMSAMAMMMMMMXMMMMXMAXXSAMXMAAAMASMMXMMMMXMSXXXMMMMXAAXMSMSMSAXXXXMASMMSXXXXXMXSMMMXSSMASX
XMAMXSMXMSSMMMSAMXSSMMMAMMXXAAMMAMSAMXSXAMASMMMAAMMMXMMSXSAMAAAAMASXMXSXMAMMASMAMXSAMXAAAXXAXAXMASAAXSMSMMAAAAMMMSMMSASAASAXASXMASAMXMMXMASA
XSAXXMASXMAAXMAMMAMMAASAMASXSSSMSMMXMASXMMASASMMAMXSAMXMASAMSSSMSAMAXAMAMXMSAXAXXMXMAXSSMSSMSMAMXMASMXXAAMMSMSMAAXXAMSSMMMMMXAAMASAMMASAMAMM
XSAMMMXMASXMMASAMSSSSMSASMSAAAAAMXSAMMMMXMMXAMASAMXMAMAMMMSMXAXXMASMMXMAMAMMMSSMMMMMSMMXMXMMAXMASMXMMMMSSMXXAXMMMSMXMMMXMAAAAMSMASAMASAXSAAX
ASMXMASXXMMMSAMMMAAAXASAMXMAMXMXMASXXAAXMSSMAMXXSXXMASAXXAMMMMMAMAAXSMSMMMSAXXXSXAAAAXXXMASMMMSMMSAAAXXAAMSMAXAXAAMSMXMASMSSMXAMXSAMMXAMMMSM
MXMASMSAMXMAMXSXMMSMXMSMSAMMXMXAMXMASXSSMAXSAMSAMXMSASMSMXSAXMAXXMMAMAAMAAMASXAXSSMMSMXXMASAXAMAASMSMSMXSXAMMMMMMSAAMASMSMAAMXMMASAMXMXSXAAA
XMSMSAMXMAMASMMMAMXXAAMASAMXAAXAAXMXMMAAMAMSXSMXMAXMASXAAXSXSASMSMSAMSMSMXSAMMXMAXMXAMAAMXSASMSMMSAAXAAAMMXAAMXMAXMMSASMXMSSMMXMMMAMMMAMMMMS
MXAAMXMAXXSASAAMMMXSMSXAMAMSASMMMXMMASXSMSXXMSAMXMSMXMXMSMSAMAMAAAXAXAMXMXMAXMMXSAMSAMAXXAMAMMAAMMXMSMSMSASMMSXMASAXMXSXXXAAAMXSMSSMAMASXAMX
ASMMXMXSMAAMSMMXAMAXAXMMMSMMAMMASAASAMAXAMXSAMXSAAXXAMAXMAMXMAMSMSMXXSAMXAXMASAAXAMSAMXAMXMAMSSMMAMXMXMAAMSAAXAMASAMMXSAMMXSMMAXMAAMXXAMMMSA
MXSMAMAXMSMMXMASXSXMAXAAAMAMSXSASXXMAMAMXMASXSASMSMSSSSSMMMAXXMAAAAMSMSMSMXSASMMMSMXMMSXMMMAXMAMSMSASAMXMXSMMSXMAXMMXASMAMXMMMMSMSSMSMSXSAAX
XAXMMMSSXAXXAMASAAMMSSSMXXAMAAMMSMXSAMAMAXXMAMAMSAMXAAASXASMSMXMSMSMAAAXAAAMAXAAAXXMSAMAMAMMSSSMAAXXSMSXXXXXMXMMMSMSMASXSSMMASMXXAMMAAMAMASX
SSSMXAMXXSSSMMAMMMMAMAAXXMSMMXMAXMAXMSMSMSSMAMMMSMSMMMMMSXSAAAMXMAXMMMMMXMSMSSSMSSMXMASMSMSAAAXMMSMASAMXXMASMMMAAAMMAXMAAMXMAMXXMASXMSMMMAMA
AAAXMSSMXXAMAAAXXXMXSSXMAMMAXSMSSMSSXAAAAAMMXMXMXMXMXXXAMSSMMSAMXAMXSMSMSMXAAAAAXXAXSAMMAASMMSMXAAMMSAMXAMXAAASXSMSXXAMMMAASXMSXSASXMAMXMAMX
MMMMAMAMSMAMSSSSSMMAMMAXMASMMSAAAAAXXMSMMSSXSAMSAMASXSMAXAXAMXMXXSXMASAAXSMMMXMMMASXMAXMMAMAAMAMXXXASXMSSSMSSMSXMXMASXXSMMMSAASASASMSASASMSM
XAXXMXAMAAMMAXMAXAMAMSXMSMSMAMMMMMMMAMXASAAAMXMMAMAXAMXSMMSSMSMXXMASMMMXMAMMXMSASXMMXAXSSSSMMSXMXSMMXAXAAAMMXMSASAXXAASXXXAMMMMAMAMXXAMXXMAA
XASASXSSXSMMXSMSXSMSXMAXXXMMSMSXMSXMSSMMSMMMMASMMSSMAMAXAAXAAAAXSSMMXSAAXAMSAMSAAXXXXXXXAAXMXXASASASXMMMSMMSAMMAMXMMSMMMMMMAMXMAMXMXMSMSSSMM
ASMMXAASAMXXAXAMAXXMASXSXSMAMXXASAXMAAAASXMASMXAAAXMAMASMMSMSMXMAAAXMMSXMAXXAXMAMMASMSMMMMMSSMMMAXAMAXXXAMXSAMMSMSXAASAXXASAMMMMMASMMAASASMX
MXAMMSMMXMAXAMXMAMXMAMAXAXMASXSMMMMMSSMMSASASXSMMMSSMSXSAMXAXMAXSMMMAMAMXMMMSMXAXAMAAAMAMXXXAASMSMSMMMSAMXMSXMXXAMMSMSSXXASXXAAASXXASMSMAMXX
XXAMXAAXXASMSMXMMSASXMMMSMSASAAXMXAAXAAMXXMXSAXXAAMAMMAMAMMSMSXMAAAXSMMMXSAAXMSSXSSMSMSSMMSMSMMAAAXSAMXMASXMSMAMAMAMXXAXMXMXSSSXMMXXMMMMXMMS
MSMMSMSAAAXAXMXSAMXSAAXAAMXMMXMXXXMSSMMMMSAAMXMSXXSAMSASAMXMAAMSSMMSMASAAMMMSAXMAMXAAASAAAXAXXMMMSMXXMAMXSMMAMMSAMXSSMMXMAAAMXMAXSSMAXMXMASA
XASMAMXMMAMAMSXMMSMSMMMSSSMSAAMMSXXXAXAASMSSMSMXMXMXMSASMSAMMMMXAMXXXAMMXSXXMXMMMMMMMSSXMSSMMMMAXXMAMMSMXXASMSAMXSMAXASXSMSMSAMAMAASXMSMSMAM
XAASMSAXMAAMXSMSXXXMAMXMAAAMMSAAAMMSMMXSAAAMMAXAAMXSXMXMAMXSAMXMXMSAMXSSMMMMAMXAMAXASAXAXAXXAXXSSMSSXAAMMSMMMMAMAMMASMMAXAAXSXXAXMXSXAAAXAMX
MSMXXSAXSAMMAXAAXMMSAMXMXMMMXMMMMXAAXAXXMMMSSMSMXSAMXMAMSMMSASMMAMXMMMAXAAMMMASMMMMXXASXMASMMSMMAAAMMSMSAAMAASAMASMXSMMMMSMMMMSMSXAXMSMXMSXM
XMXSMMSAMSAMXMSMXSAAXSAMSSXAAXAAAMSMMXSXMAAXAXAAAMAMAXAXAAMSXMMMASASAMXXXXXASMSAASXSMXMASAXXAAAMMSMSAXXXMMXSXXMSXXMAMXAXAXXAXAASAMXMMXSXXMAX
SMAMAAMXAXXMAAAXMMAXMXAXAXAMMSMMXMAASASASMSSSMMMMSSSMSSSSSMMAMXXASASASMSSXSMSAMMAMAAMXSAMXSMSSSMXXXMASMSASAMXSMMXMXAXSXSSSSSSSMSXSMMSAMXMMAM
AMAMMXSMXMASXSSSMSAMSSSMMMMAMAMAMXSAMASAMXMXXAAMMAMXAAAXMXASXMXXMMXMXMAMAASXMXMASMSMMXMXSAXXXAAXXXAMXMAAMMAMAAAAAXMAMMXMAXAXMAMXMXAAMAXSAMXA
MSMSAAXAAMMMMXAAAMXXXAAMXXMASXXXSMMMMMMAMXSAMXSSMSSSMMSMMSXMXAXSSSSSMMMMMMMAXAXMMMAAMXMMMMMSMSMMSSMMSMMMSMSMSMMSXSAMAMXMXMXMSAMAAMMMSAMXSASX
XAXAMMSSMMSAMXMMMMSSMXMMAMMASMSSMMMSAXSXMAMAMAXXMXMASXAAMSAMMSMAAMAAMAASXSSSMSAMXXSXMAMMAAAXXAAAAMAAAAAXMAMAAXXAMXMXMAXMAMAAMASASXAAMXSAXMAX
SXSMSAAAMASASXAXXMXAAXSMMSAMXAXAAAXMAMSMMMSAMSSSXSXMASMSMSAMAXMSMMSMMAXSAAAXSMXMAMAASXMASMSSSSMMMSAMXSMSMAMSSSMXSAAASMMXASXSSXMAXXMSSXSAMXMX
SMXAMMSSMMSAMXMMSASMMMXAASXSSSSMMMSMSAMXXXAMXAAXASMXAMMMXMAMASMMMAXMAMXMAMSMSMMSSSMMSAMAMAMXAXXSXMASMMMMMXXMAMAMSXSXMAXSASAAXAXASMXAXXMXMMXX
SAMSMXMAMAMMMSXAXXXAASMMMSAAAXXAAAXMMAAXMASXMSMMXMAMXMAXMMMMMMAAMXMXSAMXSXMAMMAAAAAXSMMMXAMMMMASASAMAASXMXXMMMMXMMMXMAMMXMMMMSMAXMAMAMAAMXSM
XAMAAAXMMXXMASMSMSMSMSAXAMXMMSSSMSSXSXMXAAMXAAMAXMXMMSXMAASAMXSMSSMMMAMAMAMMMMMSSSMMXAAMXMMAMSASAMASXMMAMMMMXXXAAAAAMAMMAMXXAXMMMSAMAAXMXAAA
AXSXXMSSSSXMXSXMASAAASAMXSAXXXAAAXAXXASMSMSMSMSXXMASXAAMSMSASMXAAXAAXAMMSAMAAXAMXAMMSMMSAMMXMMAXMSAMXSSMMAXMAMSSSMSXSAXSASAMXSASASASXSAAASXM
MXMASMXAAMMMAMAMAMXMMMXMAXMXMMXMSSMASMMAAAMMMMAMMMMSMMXMAAXAMXMMMSMMSSMXSXSSXSASXMMAMXASASXMXMAMASASAMAASMMMMMAMXXAASXMSASXSXSXMASXMAMMMMXAS
XXSAAAMMMMAMAXAMMSMSMSAMSXSASAMXMAAAXAMXMMMAAXAXAASXMAAXMSMSMAAXAMAMXXXXMXMAMMMAMXMAMSMSXMASAMAAMSAMMSSMMSAASMMMSMMMMXXMXMAMAMXMAMMMXMSASMMM
XXMASXSSXSXSSSSSXXAAAMXSAASASXAASXMMSSMASASXMMXSMMMAMSMXAAXAXMMMMSSMMMSAMXAMXSSMAMSSMSAMMSMSASMSXMXMAXASAXMAMASAMASAMXSMMMXMMMAMMMSXMAMASMXA
SMSMMAMXAAMAAAAXAMSMMMMMMXMAMMSXSXSAXXMASASAMSXMMSXXMASMSMSMMSAMMAXAAASAMXAMAXAXSMAMMMMMAAXXAMXXMASMMSAMMSXMMAMXSASMSAAXXASXSSXSAASAMAMSMMSS
AMAAMXMMXMSXMMAMMMXASXMASAMAMMMMXXMASMSMMMMXMAASASMSMAMMAAXXASASXASXMMSAASAMXSSMMMMXAAAMMSSMSMMMXSAAXMMMXMXSMXSMMMSAMXSMMASAAXASMSMXMAMXAAAM
MSSSMAMSMXSXSMXMAAXSAASMSAMAMASAMXSMSAAAASAMXSXMASAXMASMSMXMMSMMMMMMSMXAAMAXXAAASAMMSXSSMXMXXAMAXAXAMMSMSMAXXXXMAAMMMAXXMXMMMMMMMMMSSSSSMMSS
XXMAMASAMXMAMSAMXMSMMXSMSXSXSAMXAMXAMXSSMSXXAMXXAMXMASXAAAXSXMXAAAASAMXMASMMMSMMMASAASAAXAMXMAMSSMMSSMAAAMMSMMMSMMSXMSXXXAXAXAAXAMXAAAXAAAAM
XXMASMSASMMAMAXMAXAXXAMAMAAAMMMXSAMMMAXAXXXMSSSMASASXMMSMSXMASXXMXXXASXMXAAMAMXAXAMMSAXXMASASAMXAXAAAXMSMXAAAAXXXXMMXXASMSXMXMSSXXMMXMXXMMSS
MMAAAASAMXMMSMMMXXSMSMMAMXMMMXAAAXAXMSMMAAMXAAMXXMXMAXAXMAMSXMASMSMMMMAXSSSMAMMSMSSXAMSMSMAXSMXSMMMSSMXAXMMSSMSMAMXXMSMXAMXSAXXMMASAMMXXMAMA
AAMXSAMAMMMAAXAXMAMASXMAXAXAXMASMSSMXMAXXAAAMSMSMSASAMSSSMAXASAMXAAASMSMMMXMASAAAAAAMXAASXMASAMAXXAAAMXMSSMAXAAXSAMXMAAMSMAMAMMASMMASAASMSSS
SXSAMXSXMAMSMMASXXMAMAMSSSSMSXMXAAAXASXMAMXXSAAAAMAMAMAAMSAMXMASXMSMSAAMAAAXXMXMSAMMXMMSMAXAXMAAMMMSASXMAMMMMSMMMSAAMASMAMMMAXMAMASAMXMSAXAX
MSMXSMMMMSAMXMMAMXMMMSAAAAXMAMAMMMMMMSSSXSAXXMSMSMXMAMMSMXMAMSSMMAMAMXMMASMSAMXXAASXXMSAXXMMXXMSMXMMAMXMASXMAXASAAMMXMMXXSSMMSMASAMASMMMXMAM
XXXMXMAAAXXMASMAXAXXAMMMSMMMAXMASAMMXSAXAMASMXXAXMSSSSXXMASXXXAAXSMAMAXXMMMXMXMASAMMAMMAXSASAMXAAAXMMMXMASAMMSAMXSXSAAXAMAAAAMXAMXXMMXAAMMXM
SMXMAMMXSXAMAXSSSMXMXSMXAXAMXXXMXMMMMMAMAMAMAAMAMAAAXXXXSAMXMMMMMMSASASXXAMXMAXXMAAMSMMSMMASASMMSMSMAMSMMXMMMMMXXXASXSSMMSSMMMMXSXSXXSAMSSXM
ASXSAMMMXMMMAXXMAMAMMMMMMMSMSXSSXMASASMMSAXSXMXAMMMMMSMXMASXSASAAASXSAMXSMSASXSXXSMXMAAAAMAMMMMAAXAXASAMXSAMXAMMSMAMAAAAAXXXSXSMSASAAXXSXMAS
MSMMMXXAXAXAXSASAMMXAAMAXAMASAMXXSASASAXXAAMAMSASXSAAAAAXXAASASXSMMAMAMXAXSMMAAMXMMASMMSXMSMMAMMMSASMSMXMASMMAXAXMAMSSSMMSAASXXAMAMMMMMAASMM
XXAXAAMXMMMMMSAMXSXSSSSSMAMAMXMAAMAMMMMSAMXMAMXAMASMSMSSSXMXMAMXMAMMSSMMMMSXMSMMAXSASAMMMAMXMAXAMMMSXMXMAXMXSAMSMSXMAAXMSMMMXAMMMXMAAAMMAMXS
MMSMMXSAAXAXXMMMMAMAAAAMMXMAMXMASMMMAXXAXMXMAXMAMXMXXXAAMXMAMXMASAMXAXAASAMXXMASXXMASXAAMAMASXSXSAAMMMAMMAMAAAXAASXSMMMMAXASXXMAAASXSXSXMMAS
SAAXMAMXSMMMSAMMAAMMMMMMAXXAMSAMXMASMSXASAXAAXSXMSMASAMAMAMASAMMSAMXASXMMMSMXMMMMMMMMMSXMAXXMXAASMMSASAXSAMXMSAMXMASXXMSMSSXMASXMXMXMASXSMAS
MSSSMMSMXMMMXAMXSXSAMXXMAMMAMXAXXXXAXMMMXMSMMMMAMAMMSASAXSSMMASXXXMMAAMSXMSXSAAAMSSMMMMASAMSAMMMMAMXXMAMSMMSXXMXSMMMAXMAMXXAXXMASMSMSASASMMM
MAMXXMAMMSXSSMMXMXSMSMMMAMSSMSSMMMSSXMASMXSASASASASMSAMAXXAMXSAMXAXSMSXSAASAMSSMSAAAAAMXMAMSAMSASAMSSSXXXAAXMASAMAXSSMSMSMSMMMMMAAAMAAMXXAAA
SAMMMSAMXAAXMSMAMAMXSAASAMXXAXAAAXAXASXSAMXASASASASAMAMXMSAMMAAXSMMXAXASMMMSMAMXMMSMMSSXSMMMAMXASXSAMXMASMMSMSMMXSMMXAXAAAAMAMAXMMASMXMSMMMS
AAAAMMMMMMSMAAMAXXSAMMMMAXXMMMSXMXAXMMMXMAMXMMMMMMMAMXMXXMMMSSMMXSAMXMXMXSAAMAMSXMXXAXXXXMSXSMMXMMMMXAAAXAMSMXASAXAXMAMSMSASASXSSMASXSSMXSMM
XSMXSASAMXAMMMSXSAMXSAMSSMMAMAMASMSMSASXMSXSAAXAAXXXSXMSXAAAMAMMXMSSXMASAMXXMAXAMXMSMXMMMMMAMAMAXAASMSMXSMXMASAMASMMAXMXAMMMASAAXMAMMSAAASXS
XXMMSASXMSASXAAMMMMAXXXAAXASMASXMXAASAMAAMASXMSMSXSMXAAAXSMXXAMSAAAMASAMASASMSSMAAAAMAAAAAMXMASMSSMXAXMAMXAMMMSMMMMXSSMMXSSMAMMMMMMSXSMMMSAM
XSAMMAMAXSAMXMMSAMMMSMMSSMSMMMSMSXMMMSMMMMAMAMSMMAAASMMMXMXSSSMSMSSSMMASAMASAMXXXMSASXSSSMSAXXMAMAAMSMSMSXXXXAMXSAXAMAASAMXMMXAXAAASXMASAMMM
MSAMXAMXMMAMMMASXSASAAMXXMXSAMXASAXXAAXXXMASAMXASAMXAMXXAXAMAXAMAAXXXSAMMMXMMMMSXAMXXAMAMASMSMMASMMMMAAAMMSMMXMASXMSXSXMASAMSSSSSSXSASAMAMXS
ASAMSSSXSSSMAMXXXSMSMSSMSMMSXSMXXSMMSSXMMSMSMXMXMAXXMXSSMMSMAMMMMMSSMMMMXSAAMMAAMSMSMSMAMXMAAAXASAMXMMMXMAAAASMMSXAXAMMSXMASAAAMAXASAMXSMMAM
MXAMXXMAAAAMXXASAMXSMAMASAMMXMXMSMMMAMXAXXAXXSAMXXMMMMMAMAMXSSMASXAXXAMXASXSMSAMAMAMAXMAMSSSXSAASXXXAXMAMSSSMSAAMMMMAMASAMXMMSMSSMMMSMMXMMXX
MSSMMMMMMMMSMMSAMMASMASMSAMXAXAXAAXMASXSMMMMMAAASXSXSASAMXSMXAMASMSMSASMMMAXAXXXAMAMMMSMSAAMAMMXMASMMASXXAAAASXMMAAMSMMSAMAMAMXAXXXAAXXXMMMS
XAMAMAAAAXSAAXMASMXMXASXSMMSMSMSMMMMXMAMXAAMMMMSXASAMXSASMSAMMMXMXXAMAXMSMAMSMMSMSXSAAAXMMMMAMXASXMASAXMMSSMXMASXSXSAAXSAMXMASMMXAMSSSMXMAAA
MXSASXSXXXSMMMSAMMAMMXSAXMAAMAAAAASXMMAMSSMMAASAMXMAMAXXXMMXASAMMSMXMXMXAMMSMAXMASASMMSSMXXMAXSASASMSAMXXAMXAMMMAMMXXXMSAMSSMSAXAXAMMAAASMSM
AASXSMXXSXMSSMMSMMAXSXSASMSSSMXMSMSAMSSXMAAMXMMAMMSAMMSMXSMSMMASXAAXMAMMMSMAXAMXAMAMAAXMAXMMAMMAMAMXMMXMSASMXMAMAMMSMSAMXMASMSMSXSSSMMSMSAMX
MMSASASMSAAXXXAAXMAMSAMAMXAXMAMXMASAMAMASMMMSASAMASXXMAMAMXAAXAMMMXASMXXAAXAMXSXSMSXMMMSASXSSMMSMMMSXMAMMAMASMSSMMAAASXSSSMSXXXSAMAMMAXMXAXM
SXMXMAMASMMMXMASAXXAMAMMMMMSMMAAMASMMAMXMAAMAXXASXMAMSXMASXSSMMSAXMMAXAASMMMSAXXXAMSMSMAAXAAASAXASAXASXSMSMAMXMAMMMMMXAMAAXMMSMMMMAMMMMMMAMA
MASXMMMAMAAAXAMMASMMSXMXAASAAMSXMASAMASMSSMSMSSMMMSAMMASAXXAAAXXXMXMAMXMAAAAMMSAMXMAXAMMMMMSMMXSAMXXMMMMAAMXSXSAMXSMSMXMMMMXAAAAMMXSAAAMXMAS
SAMAAXMAXMMSAMAAAXAXAMSSMSSMSMXAMXMXMAXXAMAMXMAAMASAXSAMMSSSMMMSSMSMSAXXSMMSAMXXXAXMSMSAAXXMAXAMMXSSMAXMMMSAMAMMSXMAAAASMMXMSSSMSSMSXSSMASMX
MASMMMSSMXAAMXAMMSMMMSAAXAMMXASXMAMMASMMXMAMASMMMASAMMMXXAAAMXMXAAAAMSMXMXAAXSAMXXXXAXXXSSXSAMXSMAMASMSSMXSAMSMAMAMSMSASXAMMMMAAAXAXXXAXAXMX
SAMMXXMAASAMXMXAMAMAXMXXMMSMMXMXMMSMAMSAAXASAMMSMXXAXASXMSXXMSASMMMSMXXAMMSMSMXSAXSSMSXAXAMXMSMAMSSXMMAASMSXMAMASMMXAMAMXSAAAMMMMXSMMSSMMSSS
MASMXSMXMMAAMSSXSASMMXSMMMAAMXXAMAMMSMMXMXAMMSMAXSSMMMXAAMASAMAMMAMXXXMMXAXXMMAMMXXAASAMMAMAMAMXXAMASMSMMMMMMSSMXXSMMMSMAMSSSSMXSMXAXAAAAAMA
SMMMAMAMXSXMSMMASASMMAMAASMSMMSMSAMXMSMASMSMAAXXSMAXSMSMMMMXAAAMMSMSXMASAMSAAMAMXMMMMMAXSAMASMSMMASXMAXAMXSAAMAMXSMSMAAMAMMXMAMAMXSMMSMMMSSM
XAAMXMAAMMMMAAMAMXMAMMSSMSAMAAAXSXMSMMMAMAAMSSSMMXXMAMSXMAXSAMXSXXASASAMXXSMMSMMSAMSXSSMSXSASXAXSXMASASAMMMMXXAMSAAAMSXSMMSASXMMXAMXAMMSAMAX
SSMSMSMXAAAMSSMMMAMAMXAXSMAMMMSXMAMMASMSSSXXXMXAXXXSXXMASMMMSMASXMMMAMXXSAMXXAMAAMAMAMAAXMMXMMAXAMSAMAXAMAXMSSSMMMSMXMASAASASXAASXMMMSMMASMX
XAAXAAXXSSXMAAASXXMASMMXAMAMXMMAXMMMXMAMAMXXMASMMXMXMMXXMSAXAMASASXMXMXAMXSXSASMMXXMAMMSMXSAMXMSMMMSMMSMSMSAXXMAXXAXAMAMMMMAMMMMXXAAMAXSAMXM
XMAMSMMMMAXMXSMMASMMMXXXSMMSXSSSMSSSSMXMAMXSAMXAXAXAMXXMASXSXSXSAMXMAMMMAASXMAMMXMAXASXMAXMASAXAAXAXXXAMAAMMMMSXMXMAMMXMXXSAMXSAMSSMSMMMXXAX
MXMAAASMMMMXAXAMAMAAMMSMMASMMAAAASAXXAASAMAAAMSSXMSMXSAMAMMSAXMMXMXSAXAXMMSASAMMASMSMSAMMXMAMXSSSMMSXSASMMXAAAMXMMXMXMMSSMMAXMMAXMAASXASMSSS
ASXMMSMAAMXMASAMXMMAMAAAXXMAXMMMMMMMMSMSASMSSMAXAAAXXAAMXSAMAMAMSMMMSSSSMXSAMMXMASXAAXAMXSMXSAMXXAXSAXAMXXSSMSMAMAXXAMASAMSSMAXMMSMMMSASAAAA
SXMASAMSMMAXXXAMXASXMSMSMMSSMXXXAAXAXXXXAMXAXMASMMMSSSMMXMXXXAMXAAAAXMMAMAMAMAAMMMMSMSMMXMAAMAMXSSMMAMSMSAMXAXXMXAXSMSMSAMAMASXXAAAXXMMMMMMM
ASMMSAMXMSXSMMAMXMSAAXAXAXAMXAXSSSSSSXMMSMMMXMASAMAMMAASXMSMXSSSSSMXSMSSMXSAMMXXAAXXMAXMXSXMXAMXMAAMAMAAXXXMXMASMMMXAAASXMXMXXAMMXMMXMASXXXA
MXMASMMAMSAAAASMSSMMMMAMXMAXAMAMXAAXMAMAAAAXXMXSAMXMMSMMAMAXMXAAMXMAAMAAAMAMMXASMSMMSMSMAAAXSSMMXSMMMSMMMMXMXSMXASASXMMMSMASXXMAXAASAMXSXAXA
MMSASMSXMMMMXMXAXAXMXMXMASXMSSXMMMMMSSMSSMMMMMMXMXXSAXMSSSMSXMMMMAMSXMMSMMAMMMMAAAXAAAAMMMSAXAAMXXAXAMAMASXMASXMXMAMSAAAXMAMAAXAXSSMASAMXSMM
XAMXSMMXSAMXSXMXMMMSXMAMXMMXAAXSAMXMAAAXMAXXASMAMXMMASXXAAXMASXMMXXAASXXXSXSXXXMSMSSMSMSMAXMSSMMASAMXMXSAXAMAMMXSMSMSXMSSMMSSMMSXXAXAMAAAMAM
MSSSMXSASMSAAAAXMXXAAMMSSSMMMSXMASAMSMMMSAMASXMASASMMMMMMMXMMXAXMMMSSMASAMAXMAMXXXMMAAMXMMSMMMAMASXMMSMMASMMSSSMAAAAXASXAAAAAAAXXSAMXSXMXSAM
SAMAAAMAMXMMSXSASAMMSXAAAAAMXMMMAXXMAMXXMASXMASMSASAXASMSMASMSMMSAMXAMAMAMAMMXMAMAXMSMXSAMXXAXMMMXASXAAMAMXAAAAXMMMMMMMAXMMSSMMSMMAMXSAMXMMM
MASMMMMAMAXMAAMXSASAAXMMSSMMXXAMMSMSMSMXMASAMMAMMMMMSXSAASASMAMASASXSMXMASXSMAAASAMXMXASXXXSXMMASMMMSMSMMSSSMSMMXAXSASXSMMXMXAAAASAMXXAAASAS
SAMXMXSXSASMMSMASMMASXXAXAAMASAMXAMMXMXASAMXAAAMASAAMXMMMMSSMXMAXMAMXASMAXMAMXSMSXAASMMSMMXMAXSAXSAAAXAAXXAMAAAAXSXSASAAXXAAXMMSMMASMMMMASAS
SAMXMASAMXSASMMMSXSMMMSSSSMMAAXXSSMSASMMMMSMSSXSASMSMSXMXMASXSMMSAMXSASMSMSMMXMASXSASMXMASXSAXMXMAXSXMXSMMMMXMASMXAMAMMMMMXSASAXASXMAAMAMMMM
XXAAMMSAMASXMAAASMMAAXMAAMAMMXMMMMAMASXXAMSAAXMMMSMXAMAMXMASXSAAXAMAMAMAAXAASXMASXMAXMASXMAMXSXSSSMMXSAMMAXXXXAXAMXMXMMMSXAXAMXSMSAMSSSMMAXA
MSSSXXXAMXSMSMMXSAMSSSMMMMSMMAAAAMAMSMMSMSMMMSXMASXMMSAMAMMSXMAMXXMXMMMXMSMMMAMASXMMMMMMSMXMAXAMAXXAASASXSSMXMAXMXMXMAAASXMMXMASASMMXAXXXXMM
AAAMMMSAMXMMAMSAMMMAMXXSXMXASXSSXMAXXAAXSAMAMSAMXSAMXAAMAXMXMMAMXSXMSAMXMAMASXMASAAAAAAAMMSSSMAMMMMMMXAMAAXAMSMSMAXMASMMSAXAXMXMAMXSMSMSXSSS
SMMMAXSMMMSAMXMAXSMASMAMMSMMMAAAAASASMMSMMSAXMXMASAMXMMMXXSAXMAMXAAASAMXSXSAMAMAXXSXSSMSSMAAASXMXAAASMSMMMMXMAAAMXMAXXSASAMMSMAMAMSAAMAMAXAM
AXXMSMMAAXXMXMSMMASMXMAAMXAXMMMSMAXASAMXAASMMSXSASXMMMSSSMMASMXMMMSXSAMAMXMASXMMSMXAMXXAXMMSMMXXSMSASAAASXSASMSMMSASXAMXXXMAAXASASXMMMAMMMSM
MMSXMAMSASXMAXAAAMXXXMXSAXSMXXAMXMMSMXMSMMXAASMSASAMAXAAAMMMMASXSXXAMXSAMASMMXAXXAXAXXMASMXAAXAXSAAMMXMMMAXAXAAAXXAMMSMSSSSXSSMSXSAMXSXSAAXM
SMSASAMMAMXSASXSMXMMSMAAMSMMAMAMAXMXMAMMASXMMSAMAMAMSMMSMMAAMAMAXXMXMAMASASMAXXSSMSSMMXAMAMSXMXXMAMMMMSAMSMSMSMXMSMMAMAAAAAAXMASAXMAXAASMMSS
SASAMASMAMXMASMMMAMAAMAMXAXMAAMSSMMXSAXMAMMXMMMMXSMMXAAMXSXMMAMXMSMMMMSAMAMMSXMAAAAXAMMSSMAXASXXSSMSXASMSXAXMAMSMMMAXMMMSMMAMXAMSMMSSMAMAAMA
MAMAMXSXMMMMMMMASAMSSSSXSMSSMSAAXAXASXSMXSAAXMXMAXAXSMMMASAMSASMSAAAAMMXMAMMMAMMMMMXAMXAAXMSAMAAAAAXMMSXMMSMXMMMAAAAXSXAMXSXMAXMAMXAAXXMMMSM
MSMXAAMAMXAXMAXXXAXMMAMMMXMAAAMMSMMXSAMAMAMMSXSMMSMMASMMAMAMXMMMMXSMSMSASXSAMAMXXAXMSSSSSMAMAMXMSMMMMXSAMAMAXSASXMMMASMMSASAASXSASMSMMMXSAMX
SMMSSMXAMMAMMMMSSSMAMAMASAMXMMMAAASAMAMAMMXXMASXMAMXMAXSAMMMSMMMSMXXMASAMXMXMSMMSXSAAAXMAMXSSMMMXAAXSASAMXXXXMASAAXSAXAAAASXMAASAMXAAXAAXASM
AAXAAASMXSASASXAAXSXMAXAXASMSMMSSXMASXMASAMMMMMAXAMMXMMXASXAAAAMAASAMAMAXSMSXAAXAAXMMMMSXMAXAAXXSSMSMASAMXXMAMXSMSAMXSMMMMMASMXMAMXSMMMMSAMX
MSMMSMXAASASASMMMMAMSSSMSAMAMXXMAMXAMXSXMMMAAMMAMMSAMXXSXMMSSSMSMSMMMSMAMSAMXSMMMSMMXXMXAMXMSXMAMAMXMAMAAAASXMAMXXMXMMMMXMSXMMMMMMAMMSAAMAMX
XAAXMXMMMMAMXMAAXXXAAXAMAMMSMSMMAXMASXSMSSSSSSMAXSAXAAXMXSXAAMMSXXAMAXMXSMASAMXSXXASMSSSMMSMMMSMSAMMMMSXMSMSAMXSAMXAAAAAAXMAMXAAMMXSAMXSMSMA
SMSXSASAMXMMMSSMXSAMSSXMAMXAAAMMAMSMMASAAMMAXAMXXSAMMSSMASMMXMASXXAMXSXMXMAMAXAXMSAMAMAAMAAMMAXASMSAAAAXAAASAMASAASXSSMXAMSSMSSSXAAMXMXMAMAA
SXMAMXSAMAMAXAAMASXMAAASAXSMSMSMAMAAMAMMMSSSSSXSAMXMXAMMAMAXAMXSMSMMASAMASMSXMMSMMAMSMSMMSSSMMMXMAXXAMXMSMXMMMMSAMXAXAMSSMAMAMAMXMMSAMAMAMAX
XAMAMXMXSASXSSXMASAXMSMSAMSAAAXXSSSSMAXAAMMAAXAASXAXMASMASMSSSXMAAAMASMMAXXAXAAAAAXMAMAAXAAXAASAMXMMXAXXXSAMXAASMMMSMMMAAMAMAMAMXAAXMSMSXSMX
SXMASMAMSAMXMASMMSAMXAMXMASMMXMAMMXXXXSMSSMMMMXMASXSXSXMMSXXMAMMSXSAMXMMASMXMMSSSMSSXSSSMMSSSMSMSAXXMASXMASXSMMSXSXAASMMSSMSXSXSXMSMMAMXMAMS
