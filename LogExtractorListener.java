class LogExtractorListener extends SASLogBaseListener {
    private boolean source;
    private boolean source2;
    private boolean mprint;

    public LogExtractorListener(boolean source, boolean source2, boolean mprint) {
        this.source = source;
        this.source2 = source2;
        this.mprint = mprint;
    }

    @Override
    public void exitSource(SASLogParser.SourceContext ctx) {
        if (source) {
            if (ctx.SOURCE().getText().length() > 12) {
                System.out.print(ctx.SOURCE().getText().substring(11));
            }
        }
    }

    @Override
    public void exitSource2(SASLogParser.Source2Context ctx) {
        if (source2) {
            if (ctx.SOURCE2().getText().length() > 12) {
                System.out.print(ctx.SOURCE2().getText().substring(11));
            }
        }
    }

    @Override
    public void exitMprint(SASLogParser.MprintContext ctx) {
        if (mprint) {
            System.out.print(ctx.MPRINT().getText().substring(ctx.MPRINT().getText().indexOf(':') + 1));
        }
    }
}

