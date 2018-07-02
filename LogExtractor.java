import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class LogExtractor {
    private String logFile;

    private boolean source = true;
    private boolean source2 = false;
    private boolean mprint = false;

    public static void main(String[] args) throws Exception {
        /* TODO check args.length() */
        if (args.length < 1) {
            System.err.println("java me.sspkmnd.saslint.saslog.LogExtractor [-nosource] [-source2] [-mprint] <input-filename>\n");
            return;
        }

        LogExtractor le = new LogExtractor(args);
        le.extract();
    }

    public LogExtractor(String[] args) {
        for (int i = 0; i < args.length; i++) {
            if (args[i].equals("-nosource")) {
                source = false;
            }
            else if (args[i].equals("-source2")) {
                source2 = true;
            }
            else if (args[i].equals("-mprint")) {
                mprint = true;
            }
            else {
                logFile = args[i];
//                tmpFile = new File(args[i]);
//                if (!(tmpFile.exists() && tmpFile.isFile())) {
//                    tmpFile = null;
//                }
            }
        }
    }

    private void extract() throws IOException {
        /* TODO refactor */
        //InputStream is = new FileInputStream(tmpFile);
        //ANTLRInputStream input = new ANTLRInputStream(is);

//        System.out.println(42);
//        CharStream stream = CharStreams.fromPath(Paths.get(tmpFile.getAbsolutePath()));
//        SASLogLexer lexer = new SASLogLexer(stream);
//        CommonTokenStream tokens = new CommonTokenStream(lexer);
//        SASLogParser parser = new SASLogParser(tokens);
//        ParseTree tree = parser.saslog();
//        ParseTreeWalker walker = new ParseTreeWalker();
//        LogExtractorListener extractor = new LogExtractorListener(source, source2, mprint);
//        walker.walk(extractor, tree);

        SASLogLexer lexer = new SASLogLexer(CharStreams.fromFileName(logFile));
        SASLogParser parser = new SASLogParser(new CommonTokenStream(lexer));
        ParseTree tree = parser.saslog();
        ParseTreeWalker walker = new ParseTreeWalker();
        LogExtractorListener extractor = new LogExtractorListener(source, source2, mprint);
        walker.walk(extractor, tree);
    }
}
