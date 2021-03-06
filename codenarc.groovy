
ruleset {

    description 'Groovy Scripts CodeNarc RuleSet'

    ruleset( "http://codenarc.sourceforge.net/StarterRuleSet-AllRulesByCategory.groovy.txt" ) {

        DuplicateNumberLiteral   ( enabled : false )
        DuplicateStringLiteral   ( enabled : false )
        BracesForClass           ( enabled : false )
        BracesForMethod          ( enabled : false )
        BracesForIfElse          ( enabled : false )
        BracesForForLoop         ( enabled : false )
        BracesForTryCatchFinally ( enabled : false )
        JavaIoPackageAccess      ( enabled : false )
        ConfusingMethodName      ( enabled : false )
        UnnecessarySubstring     ( enabled : false )
        FactoryMethodName        ( enabled : false )
        Println                  ( enabled : false )
        SystemErrPrint           ( enabled : false )

        LineLength               ( length                : 170 )
        VariableName             ( finalRegex            : /[a-zA-Z0-9_]+/ )

        // http://codenarc.sourceforge.net/codenarc-configuring-rules.html#Standard_Properties_for_Configuring_Rules
        FileCreateTempFile       ( doNotApplyToFilesMatching : '*/src/main/groovy/Timer.groovy' )
        AbcComplexity            ( doNotApplyToFilesMatching : '*/src/test/groovy/mediawiki/y2m.groovy' )
    }
}
