%===========================================================================
%    Nocturne Op.55 No.1 in F Minor (F.Chopin)
%===========================================================================
%
%--- Notes -----------------------------------------------------------------
%
%  * Transcribed using the manuscript as the primary source.
%  * Slurs that connect to tied notes always end on the first note
%    and start on the last note (for visual consistency).
%  * Some acciaccaturas have slurs added to the note they connect to.
%  * MIDI output probably isn't accurate. I didn't test for it.
%  * Bar 19: the manuscript only has eighths here, not a dotted 8
%    followed by 16 as in many scores.
%  * Bar 27 and 43: following the manuscript, and since there's no
%    ambiguity, these triplets have their numbers hidden.
%  * Bar 48 and 57: we only show the triplet numbers once and then hide
%    them, as per the manuscript and for clarity.
%  * Bar 56: the manuscript indicates <bf d g>8. <bf d af'>16 <bf d bf'>4
%    here, and not a <bf d af'>4 at the end like in many scores.
%  * Bar 72: contrary to many scores, the manuscript indicates no fermata
%    on the g4., and no tie combining the c16 with the next bar's c4.
%  * Bar 73: manuscript indicates "tempo primo", which is changed to
%    "a tempo" since it means the same and is the more common notation.
%
%---------------------------------------------------------------------------
%
%--- Author ----------------------------------------------------------------
%
%    (C) 2016, Michiel Sikma <michiel@sikma.org>
%    Licensed under CC BY-SA 4.0.
%
%---------------------------------------------------------------------------
%
% -*- output: output/;

FILENAME = "nocturne-op-55-1"
AUTHORS = "M.Sikma"
HEADERS-DIR = "./includes/"

\version "2.18.2"
\language "english"
\include "includes/ms.ily"
\include-header

% Main time signature.
section-one = {
  \key f \minor
  \time 4/4
  \partial 4
  % The manuscript only indicates "andante", but that generally means 76-108.
  \tempo "Andante" % 4 = 76 - 108
}

% The main left hand passage used during the primary theme.
lh-main-chords = {
  \relative c, {
    f4-. \sustainOn <af' c f>-. \sustainOff
    g,-. \sustainOn <ef' bf' ef>-. \sustainOff |
    af,4-. \sustainOn <c' af'>-. \sustainOff
    e,,-. \sustainOn <bf'' c g'>-. \sustainOff
  }
}
% Main left hand passage during trill section.
lh-main-chords-var-one = {
  \relative c, {
    f4-. \sustainOn <af' c f>-. \sustainOff
    g,-. \sustainOn <ef' bf' ef>-. \sustainOff |
    af,4-. \sustainOn <c' af'>-. \sustainOff
    bf,-. \sustainOn <gf' df' gf>-. \sustainOff |
    c,4-. \sustainOn <af' c f>-. \sustainOff
    c,,-. \sustainOn <c' c'>-. \sustainOff
  }
}
% The main left hand passage, after the first part's mid section.
% Modifies the first chord.
lh-main-chords-var-two = {
  \relative c, {
    f4-. \sustainOn <c' af'>-. \sustainOff
    g-. \sustainOn <ef' bf' ef>-. \sustainOff |
    af,4-. \sustainOn <c' af'>-. \sustainOff
    e,,-. \sustainOn <bf'' c g'>-. \sustainOff
  }
}
% The left hand passage, during the variation with eighth notes.
% Modifies the third chord.
lh-main-chords-var-three = {
  \relative c, {
    f4-. \sustainOn <af' c f>-. \sustainOff
    g,-. \sustainOn <ef' bf' ef>-. \sustainOff |
    af,4-. \sustainOn <ef' af ef'>-. \sustainOff
    e,-. \sustainOn <bf'' c g'>-. \sustainOff
  }
}

% Final right hand chord of the main theme, without grace note.
rh-main-theme-closing-chord = {
  <<
    \new Voice {
      \voiceOne
      af4-5 g8. f16
    }
    \new Voice {
      \voiceTwo
      <bf, e>4. r8
    }
  >>
}

% Final right hand chord of the main theme, with grace note.
rh-main-theme-closing-chord-grace = {
  <<
    \new Voice {
      \voiceOne
      \acciaccatura bf,8 af'4-5 g8. f16
    }
    \new Voice {
      \voiceTwo
      <bf, e>4. r8
    }
  >>
}

% Final right hand chord of the main theme, before
% the più mosso section.
rh-main-theme-closing-chord-piu = {
  <<
    \new Voice {
      \voiceOne
      \acciaccatura bf,8 af'4^(-5 g8. f16 |
      <af, f'>4)^\markup { \italic "più mosso" }
    }
    \new Voice {
      \voiceTwo
      <bf e>4. r8
    }
  >>
}

% The second theme, right hand part.
rh-second-theme = {
  af4( af |
  bf4) d,8-1( \< ef-2 f-3 ef-1 af bf |
  c2) \! c4( c |
  % Manuscript does not have af8. g16, only eighths.
  d4) fs,8( \< g af8^[ g8 c8 d^] |
  e2 \! f4 \> ef8.) df16( |
  df4 c df c8. bf16 |
  bf4 af g \acciaccatura bf8 af8. g16 |
  % Manuscript appears to indicate that the slur is cut off
  % and started anew here.
  g4 \! g) g( \acciaccatura bf8 af8. g16 |
  g4_\markup { \italic "ritenuto" } c c)
}

% The second theme, left hand part.
lh-second-theme = {
  \relative c, {
    <<
      \new Voice {
        \voiceOne
        r4 <af'' c>2( <af d>4)
      }
      \new Voice {
        \voiceTwo
        f,4-. \sustainOn r4 f'-3 \sustainOff ff-4
      }
    >> |
    <<
      \new Voice {
        \voiceOne
        r4 <af df?>4 ef,_. \sustainOn \stemDown <g' df'>4^. \sustainOff
      }
      \new Voice {
        \voiceTwo
        ef2-3 s2
      }
    >> |
    af,4-. \sustainOn <ef' af c>-. \sustainOff
    af,-. \sustainOn <d f c'>-. \sustainOff |
    g,4-. \sustainOn <d' f! c'>-. \sustainOff
    g,-. \sustainOn <f' b>-. \sustainOff |
    c,4 \sustainOn <bf'' c g'>-. \sustainOff
    c,-. \sustainOn <af' c af'>-. \sustainOff |
    c,4-. \sustainOn <g' ef'>-. \sustainOff
    c,-. \sustainOn <f af f'>-. \sustainOff |
    <<
      \new Voice {
        \voiceOne
        b4\rest <ef, c'>4 b'4\rest <df, f b> |
        b'4\rest <e, c'> b'4\rest <f b>~ |
        <f b>4 <e bf'>2
      }
      \new Voice {
        \voiceTwo
        c2 c2 | c2 c2 | c2. d4\rest
      }
      \new Voice {
        \voiceThree
        s1 | s2.
        % Force the note back in horizontal sync with the other voice.
        \once \override NoteColumn.force-hshift = #0.0
        df4
      }
    >>
  }
}

% The final repeating triplets in the coda.
rh-coda-triplets = {
  \relative c''' {
    \tuplet 3/2 { f8 af c }
    \tuplet 3/2 { f g, af }
  }
}

\book {
  \paper {
    markup-system-spacing = #'((padding . 0))
    bookTitleMarkup = \markup {
      \column {
        \override #'(baseline-skip . 5.0)
        \fill-line {
          \fontsize #7.2
          \pad-markup #3
          \fromproperty #'header:title
        }
        \fill-line {
          \fromproperty #'header:dedication
        }
        \fill-line {
          \composed
        }
        \fill-line {
          \large \bold
          \fromproperty #'header:subtitle
        }
        \fill-line {
          \smaller \bold
          \fromproperty #'header:subsubtitle
        }
        \fill-line {
          \fromproperty #'header:poet
          { \large \bold \fromproperty #'header:instrument }
          \fromproperty #'header:composer
        }
        \fill-line {
          \fromproperty #'header:meter
          \fromproperty #'header:arranger
        }
      }
    }
  }
  \score {
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing =
        #'((basic-distance . 9)
           (minimum-distance . 7)
           (padding . 0.1)
           (stretchability . 5))
    } <<
      \set PianoStaff.connectArpeggios = ##t
      %---------------------------------------------------------------------
      %    Right hand
      %---------------------------------------------------------------------
      \new Staff = "right" \with {
        midiInstrument = "acoustic grand"
      } {
        \clef treble \relative c'' {
          \section-one
          c4~-2( \p |
          c4 f-5 ef df |
          c8.-[ b16 c8. df16-] c2~) |
          c4( f ef df |
          c8.-[ b16 c8. \acciaccatura df8 ef16-] c2~) |
          c4( f ef df |
          c2 bf4-2 \trill \grace { a16 bf } c8. df16-4 |
          af2-2
          % todo: fix this slur
          \rh-main-theme-closing-chord |
          \acciaccatura af8 f'2) c'4-. c4~( |
          c4 f ef df |
          c8.-[ b16 c8. df16-] c2~) |
          c4( f ef df |
          c8.-[ b16 c8. ef16-] \acciaccatura df8 c2~) |
          % todo: fix this slur
          c4( f ef df |
          c2 \grace { a16 bf } \afterGrace bf2-2
          \startTrillSpan { a8-.[ \stopTrillSpan bf-. c-. ef-.-5 df-.-4] } |
          af!2-2)
          % Same as \rh-main-theme-closing-chord-grace,
          % but with slur to the note directly after it.
          <<
            \new Voice {
              \voiceOne
              \acciaccatura bf,8 af'4-5 g8. f16
            }
            \new Voice {
              \voiceTwo
              <bf, e>4. r8
            }
          >> |
          \acciaccatura af8 f'2 \rh-second-theme c4~( |
          c4 f-5^\markup { \raise #1 \italic "a tempo" } ef df |
          c8.-[ b16 c8. df16-] c2~) |
          c4(
          % Tuplet numbers are hidden as per manuscript.
          \override TupletNumber.stencil = ##f
          \tuplet 3/2 { e8-3 g-5 f-4 }
          \tuplet 3/2 { ef-3 ef,-1 bf'-2 }
          \tuplet 3/2 { c-3 ef-5 df-4 } |
          \tuplet 3/2 { c8-5 c,-1 ef }
          \tuplet 3/2 { af a-1 df-3 } c2)~ |
          \revert TupletNumber.stencil
          c4( \f f ef df |
          c2
          \grace { a16 bf } \afterGrace bf2
          \startTrillSpan { a8-.[ \stopTrillSpan bf-. c-. df-.] }
          % fixme: proper positioning of this slur
          af2)^(
          \rh-main-theme-closing-chord-grace |
          \acciaccatura af8 f'2^) \rh-second-theme c4~(\> |
          c4 f\!-5^\markup { \italic "a tempo" } ef df |
          c8.-[ b16 c8. df16-] c2~) |
          c4(
          % Tuplet numbers are hidden as per manuscript, except the 7-tuplet.
          \override TupletNumber.stencil = ##f
          \tuplet 3/2 { e8-3 g-5 f-4 }
          \tuplet 3/2 { ef-3 ef,-1 bf'-2 }
          \tuplet 3/2 { c-3 ef-5 df-4 } |
          \revert TupletNumber.stencil
          % Modify the tuplet bracket to reset the number to its regular
          % position. Otherwise it tries to avoid colliding with the fingering.
          \once \override TupletBracket.avoid-scripts = ##f
          \tuplet 7/4 { c8-5 c,-1 ef af b c \acciaccatura ef df }
          c2)~ |
          c4( \f f ef df |
          c2 \grace { a16 bf } \afterGrace bf2-2
          \startTrillSpan { a8-.[ \stopTrillSpan bf-. b-. c-. ef-. df-.] } |
          af2)-2
          \rh-main-theme-closing-chord-piu
          % Four sequences of thirds plus chords.
          % The thirds are in the left hand section.

          % Manuscript indicates f, not ff.
          % It's indicated at the start of the first triplet.

          <<
            \new Voice {
              \voiceOne
              \relative c' {

                s4 \f s4 s4 |
                s4
                <af' f'>2\>
                % Manually shifting this to -1.35, needed to properly position
                % the chord to the right of it.
                \once \override NoteColumn.X-offset = #-1.35
                <g bf f'>4 |
                <af c f>4\!
              }
            }
            \new Voice {
              \voiceTwo
              \autoBeamOff
              \crossStaff {
                \relative c' {
                  s2. |
                  s4
                  % todo ignore decrescendo with unspecified starting volume
                  % todo is the length correct?
                  % todo override the positioning
                  f2
                  \once \override NoteColumn.ignore-collision = ##t
                  <df f>4 |
                  <c f>4 s4
                }
              }
              \autoBeamOn
            }
          >>
          s2 |
          s4
          <ef g ef'>2\> <f g d'>4 |
          % fixme: connect acc to the top note
          \acciaccatura d'8\! <ef, g c>8.\< <f g b>16 <ef g c>4\! s2 |
          s4 <ef c'>2\> <d f c'>4 |
          % fixme is the length of the decrescendo correct?
          <ef g c>4\! s4 s2 |
          s4 <bf d bf'>2\> <c d af'>4\! |
          <<
            \new Voice {
              \voiceOne
              \acciaccatura a'8 <g d bf>8.\< <fs d c>16 <g d bf>4\! g4( \p g4-1 |
              df'2
              \override TupletNumber.stencil = ##f
              \tuplet 3/2 { c8 df c }
              \tuplet 3/2 { df ef df } |
              \stemUp
              c4 f f2) |
              df2^(
              \tuplet 3/2 { c8 df c }
              \tuplet 3/2 { df ef df } |
              c4 f f2) |
              gf2^(
              \tuplet 3/2 { f8 gf f }
              \tuplet 3/2 { gf af gf } |
              f4 bf4 bf2) |
              gf2^(
              \tuplet 3/2 { f8\< gf f }
              \tuplet 3/2 { gf af gf } |
              \revert TupletNumber.stencil
              f4\! bf4 bf2) |
              bf2^( af4. gf8 |
              <gf gf,>2 <f f,>2 |
              <f f,>2 <e e,>2~ |
              <e e,>2 <e e,>4.\< <f f,>8\! |
              <f, af f'>4)
            }
            \new Voice {
              \voiceTwo
              \relative c'' {
                s1 |
                s1 |
                bf4\> af g f\! |
                f2 e2 |
                g2 f2 |
                ef'1 |
                ef4\> df c bf\! |
                bf2 a2 |
                c2 bf2 |
                <df f>1\> \f |
                \once \override NoteColumn.force-hshift = 1
                bf1 |
                {
                  \once \override NoteColumn.force-hshift = 1
                  \shape #'((0 . 0) (0 . 0.24) (0 . 0.24) (0 . 0)) Tie
                  bf1_~
                } |
                % Ignore the warning about clashing note columns,
                % since this is correct.
                \once \override NoteColumn.ignore-collision = ##t
                \stemUp bf2\! \stemNeutral bf2 |
              }
            }
          >>
          <<
            \new Voice {
              \voiceOne
              \relative c' {
                \stemDown f''16( \f
                % Lots of manual fixes to get the rallent textspanner
                % at just the right place. Normally it's too far down
                % because it will try to align the top of the "rallent" text
                % with the lowest note before the end of the spanner.
                \textSpannerDown
                \once \override TextSpanner.outside-staff-priority = ##f
                \once \override TextSpanner.Y-offset = #-5
                \once \override TextSpanner.bound-details.left.text = #"rallent "
                ef\startTextSpan df c cf af g f e f ef df |
                \stemNeutral c cf af g bf af g f e f ef df c df af bf \stopTextSpan |
                % todo fix the slur

                % The manuscript does not indicate a fermata on the g.
                % Also, no tie is indicated.
                % todo turn off beam
                c4)(\<^\markup { \raise #1 \italic "stretto" } df f e\! |
                % Manuscript indicates no fermata over the g.
                e4^\markup { \raise #1 \italic "ritenuto" } f
                af4 \autoBeamOff g8. c16) \autoBeamOn
              }
            }
            \new Voice {
              \voiceTwo
              \relative c' {
                s4 s2 |
                s1 |
                s1 |
                % Added a visible rest here to clarify the tempo.
                s4 s4 r8 <b f'>4
                \once \override Script.padding = #1.3
                <bf e>16^\fermata r16
              }
            }
          >>
          % Manuscript indicates "tempo primo".
          c'4(^\markup { \raise #1 \italic "a tempo" } \p f ef df |
          c8.-[ b16 c8. df16-] c2)~ |
          c4(
          \override TupletNumber.stencil = ##f
          \tuplet 3/2 { e8 g f }
          \tuplet 3/2 { ef ef, bf' }
          \tuplet 3/2 { c ef df } |
          \tuplet 3/2 { c8 c, ef }
          \tuplet 3/2 { af a df } c2)~ |
          c4
          % Start of the coda.
          \tuplet 3/2 { f8(^\markup { \raise #1 \italic "molto legato e stretto" } f' f, }
          \tuplet 3/2 { e' g, e' }
          \tuplet 3/2 { af, ef' a, } |
          \tuplet 3/2 { d bf d }
          \tuplet 3/2 { df df, df' }
          \tuplet 3/2 { c d, c' }
          \tuplet 3/2 { ef, bf' e, } |
          \tuplet 3/2 { bff' f bff }
          \tuplet 3/2 { af af, af' }
          \tuplet 3/2 { aff df, aff' }
          \tuplet 3/2 { gf gf, gf' } |
          \tuplet 3/2 { f f, af }
          \tuplet 3/2 { c ef df }
          \tuplet 3/2 { c e, g }
          \tuplet 3/2 { b c bf } |
          \tuplet 3/2 { a af f }
          \tuplet 3/2 { f' f, f' }
          \tuplet 3/2 { g, e' af, }
          \tuplet 3/2 { ef' a, ef' } |
          \tuplet 3/2 { d bf d }
          \tuplet 3/2 { df df, df' }
          \tuplet 3/2 { d, c' ef, }
          \tuplet 3/2 { bf' e, bf' } |
          \tuplet 3/2 { bff f bff }
          \tuplet 3/2 { af df, af' }
          \tuplet 3/2 { gf df gf }
          \tuplet 3/2 { f df f } |
          \tuplet 3/2 { gf df gf }
          \tuplet 3/2 { f df f }
          \tuplet 3/2 { c' c, f }
          \tuplet 3/2 { e bf c } |
          \tuplet 3/2 { f af, c }
          \tuplet 3/2 { a\< c ef }
          \tuplet 3/2 { gf a c }
          \tuplet 3/2 { ef gf a\! } |
          \tuplet 3/2 { gf'\> c, ef }
          \tuplet 3/2 { a, gf c, }
          \tuplet 3/2 { ef a, gf\! }
          \tuplet 3/2 { c, ef a, } |
          \tuplet 3/2 { bf f g? }
          \tuplet 3/2 { bf\< df f }
          \tuplet 3/2 { g bf df }
          \tuplet 3/2 { f g bf\! } |
          \tuplet 3/2 { df\> g, bf }
          \tuplet 3/2 { e, df g, }
          \tuplet 3/2 { bf e, df\! }
          \tuplet 3/2 { g, bf e, } |
          \tuplet 3/2 { f a c }
          \tuplet 3/2 { f bf, c }
          \tuplet 3/2 { a c f }
          \tuplet 3/2 {
            \once \override TextSpanner.outside-staff-priority = ##f
            \once \override TextSpanner.Y-offset = #-5
            \once \override TextSpanner.bound-details.left.text = #"cresc. "
            a \startTextSpan
            d, f
          } |
          \tuplet 3/2 { c f a }
          \tuplet 3/2 { c g a }
          \tuplet 3/2 { f a c }
          \tuplet 3/2 { g' bf, c } |
          \tuplet 3/2 { a c f }
          \tuplet 3/2 { a e f }
          % Ending the text span one note early to give the next one
          % some space.
          \tuplet 3/2 { c f a \stopTextSpan }
          \tuplet 3/2 {
            \once \override TextSpanner.outside-staff-priority = ##f
            \once \override TextSpanner.Y-offset = #-5
            \once \override TextSpanner.bound-details.left.text = #"dim. ed accel. "
            c \startTextSpan
            g a
          } |
          \tuplet 3/2 { f a c }
          \tuplet 3/2 { f a, c }
          \ottava #1
          % Add some more padding to the ottava.
          \override Score.OttavaBracket.padding = #3
          \set Staff.ottavation = #"8"
          \tuplet 3/2 { a? c f }
          \tuplet 3/2 { g d f } |
          \tuplet 3/2 { c f af }
          \tuplet 3/2 { c g af }
          % Repeating section.
          \rh-coda-triplets |
          \rh-coda-triplets
          \rh-coda-triplets |
          \rh-coda-triplets
          \rh-coda-triplets |
          \rh-coda-triplets
          \rh-coda-triplets |
          f4) \stopTextSpan
          \ottava #0
          \revert TupletNumber.stencil
          r4 r2 |
          % Final chords.
          <<
            \new Voice {
              \voiceOne
              % todo make this slur a bit nicer
              <df,, f ef'>2\>(^\markup { \raise #1 \italic "a tempo" }
              <bf e c'>2\! |
              <a c f a>1\arpeggio |
              <a c f a>2-.\arpeggio \f <a c f a>2-.\arpeggio |
              <a c f a>1)\arpeggio \fermata \bar "|."
            }
            \new Voice {
              \voiceTwo
              \once \override NoteColumn.force-hshift = 1.35
              g'1
            }
          >>
        }
      }

      %---------------------------------------------------------------------
      %    Left hand
      %---------------------------------------------------------------------
      \new Staff = "left" \with {
        midiInstrument = "acoustic grand"
      } {
        \clef bass \relative c, {
          \section-one
          r4 |
          \lh-main-chords
          \lh-main-chords
          \lh-main-chords-var-one
          \relative c {
            f,4-. \sustainOn <af' c>-. \sustainOff f,-. \sustainOn <g' e'>-. \sustainOff |
          }
          \lh-main-chords
          \lh-main-chords
          \lh-main-chords-var-one
          \lh-second-theme
          \lh-main-chords-var-two
          \lh-main-chords-var-three
          \lh-main-chords-var-one
          \lh-second-theme
          \lh-main-chords-var-two
          \lh-main-chords-var-three
          \lh-main-chords-var-one
          % Sequences of thirds and chords.
          % We omit the tuple numbers for all but the first sequence.
          <f' c'>4
          <<
            \new Voice {
              \voiceOne
              \relative c' {
                \tuplet 3/2 { b8( c df }
                \tuplet 3/2 { c g bf }
                \tuplet 3/2 { af e g } |
                f4)
              }
            }
            \new Voice {
              \voiceTwo
              \relative c {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { b8( c df }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { c g bf }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { af e g } |
                f4)
                \sustainOn
                <f' c'>2
                f4 \sustainOff |
                f4
              }
            }
          >>
          <<
            \new Voice {
              \voiceOne
              \relative c' {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { b8( c df }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { c g bf }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { af e f } |
                g4)
              }
            }
            \new Voice {
              \voiceTwo
              \relative c {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { b8( c df }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { c g bf }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { af e f } |
                g4)
                \sustainOn
                <g' c>2 <g b>4 \sustainOff
              }
            }
          >> |
          <c g' c>8. <c g' d'>16 <c g' c>4
          <<
            \new Voice {
              \voiceOne
              \relative c {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { fs8( g af }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { g d ef } |
                c4)
              }
            }
            \new Voice {
              \voiceTwo
              \relative c, {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { fs8( g af }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { g d ef } |
                c4)
              }
            }
          >>
          <c g' c>2 <c af' c>4 |
          <c g' c>4
          <<
            \new Voice {
              \voiceOne
              \relative c {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { fs8( g af }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { g d f }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { ef b c } |
                d4)
              }
            }
            \new Voice {
              \voiceTwo
              \relative c, {
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { fs8( g af }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { g d f }
                \once \override TupletNumber.stencil = ##f
                \tuplet 3/2 { ef b c } |
                d4)
              }
            }
          >>
          <d g>2 <d fs>4 |
          <bf d g>8. <bf d af'>16
          % The manuscript indicates a high bf here, not a g.
          <bf d bf'>4
          r2 |
          % We'll show the tuplet number for one bar only.
          \relative c {
            \tuplet 3/2 { e,8^(_[ df' bf_] } g'4)
          }
          \relative c {
            \tuplet 3/2 { e,8^(_[ df' bf_] } g'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { f,8^(_[ c' bf_] }
            af'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { bf8^(_[ f' c_] }
            c'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { g8^(_[ f' df_] }
            bf'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { g8^(_[ e' df_] }
            bf'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { af8^(_[ g' c,_] }
            c'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { af8^(_[ f' c_] }
            c'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { a8^(_[ gf' ef_] }
            c'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { a8^(_[ gf' ef_] }
            c'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { bf8^(_[ f' df_] }
            df'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' f_] }
            f'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { c8^(_[ bf' gf_] }
            ef'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { c8^(_[ a' f_] }
            ef'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ c' f,_] }
            f'4)
          }
          \relative c {
            \once \override TupletNumber #'stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' f_] }
            f'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df,8^(_[-. bf'' gf_] }
            gf'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' gf_] }
            gf'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' gf_] }
            df'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' gf_] }
            df'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' g?_] }
            df'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' g_] }
            df'4)
          } |
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' g_] }
            df'4)
          }
          \relative c {
            \once \override TupletNumber.stencil = ##f
            \tuplet 3/2 { df8^(_[ bf' g_] }
            df'4)
          } |
          <df af' cf>4 r4 r2 |
          R1 |
          <<
            \new Voice {
              \voiceOne
              \relative c {
                r8 <e g>4 <f af> <af d> <gs d>8~ |
                <gs d>8 <g cs>4 <f c'>
              }
            }
            \new Voice {
              \voiceTwo
              \relative c {
                r8 c4( cf bf e,8~ |
                e8 a4 af g
                \once \override Script.padding = #0.65
                c,16)
                \fermata r16
              }
            }
          >>
          \lh-main-chords-var-two
          \lh-main-chords-var-three
          % todo: fix positioning of sustain off
          f,4-. \sustainOn \clef treble <c'' af'>-. \sustainOff
          \clef bass f,-. \sustainOn \clef treble <c' f c'>-. \sustainOff |
          \clef bass bf,-. \sustainOn \clef treble <df' f bf>-. \sustainOff
          \clef bass c,-. \sustainOn \clef treble <c' g' c>-. \sustainOff |
          \clef bass df,-. \sustainOn <af' df f>-. \sustainOff bf,-. \sustainOn <bf' df>-. \sustainOff |
          c,-. \sustainOn <af' c>-. \sustainOff c,,-. \sustainOn <g'' c>-. \sustainOff |
          f,-. \sustainOn <c' af' c>-. \sustainOff f,-. \sustainOn <f' c' f>-. \sustainOff |
          bf,-. \sustainOn <f' bf f'>-. \sustainOff c-. \sustainOn <g' c>-. \sustainOff |
          % No sustain here as per manuscript.
          df,-.
          % Staccato ends here as per manuscript.
          <df' af'> <bf bf'> <cf af'> |
          <bf bf'> <cf af'> <c af'>
          <<
            \new Voice {
              \voiceOne
              \stemDown
              % Ignore the clashing note columns.
              \once \override NoteColumn.ignore-collision = ##t
              % todo fix the positioning of this tie
              c4~ |
              c4 g' f ef |
              \stemUp
              ef2 \sustainOn f4 \sustainOff ef |
              df2 \sustainOn c4. \sustainOff bf8 |
              bf2 \sustainOn df2 \sustainOff |
              s2 a'!2~ |
              a1~ |
              a1~ |
              a1~ |
              a1 |
              a1~ |
              a1~ |
              a1~ |
              a4 s4 s2
            }
            \new Voice {
              \voiceTwo
              \stemDown
              \relative c {
                g'4
              } |
            }
            \new Voice {
              \voiceThree
              s4 |
              \relative c {
                f,1_~ |
                \override NoteColumn.force-hshift = 0
                f1_~ |
                f1_~ |
                f1 |
                <f c'>1_~ |
                <f c'>1_~ |
                <f c'>1_~ |
                <f c'>1_~ |
                <f c'>1 |
                <f c'>1_~ |
                <f c'>1_~ |
                <f c'>1_~ |
                <f c'>4 d'4\rest d2\rest |
                \revert NoteColumn.force-hshift
              }
            }
            \new Dynamics {
              s4 |
              s1 |
              s1 |
              s1 |
              s1 |
              s1 |
              s1 |
              s1 |
              s2 s2 \sustainOn |
              s1 |
              s1 |
              s1 |
              s1 |
              s2. s4 \sustainOff
            }
          >>
          \relative c, {
            % Manuscript appears to indicate a slur on only these
            % two groups of notes, rather than to the end.
            <bf bf'>2( <c c'>2) |
            <f c' f>1 \arpeggio |
            <f c' f>2 \arpeggio <f c' f>2 \arpeggio |
            \once \override Script.padding = #1.5
            <f c' f>1_\fermata \arpeggio
          }
        }
      }
    >>
    \layout {
      \context {
        \Score
        % Set the score to a default note value of one crotchet.
        \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
        \consists #Span_stem_engraver
      }
    }
    \midi {
      \tempo 4 = 96
    }
  }
}
