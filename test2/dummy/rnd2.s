target
    memsize 8
    byteorder big
    pointersize 32
    wordsize 32
    charset "latin1"
    float "ieee754";

export bits32 Cmm.globalsig.bcPDWKVXdYZZBPSFTVVJOBXQNc;

section "data" { align 1; }

section "data" { sym@Cmm.globalsig.bcPDWKVXdYZZBPSFTVVJOBXQNc: }

section "data" { sym@Cmm.global_area: }

section "data" { bits8[0::bits32]; }

section "text"
{
    sym@p()
    {
        $r31 = ($r31+-24);
        $t1 = $r30;
        initialize continuations:l5:
        proc body start:l4:
        $r31 = ($r31+24);
        $c0 = $t1;
    }
}

section "text" {  }

