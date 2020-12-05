--import System.Posix.StatVFS ( fStatVFS, statVFS )
--import System.Posix.IO ( openFd, defaultFileFlags, OpenMode(ReadOnly) )

main :: IO ()
main = do
  fd <- openFd "/etc/fstab" ReadOnly Nothing defaultFileFlags
  fStatVFS fd >>= print
  statVFS "/dev" >>= print