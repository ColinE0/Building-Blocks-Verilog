"""Compile and run each SystemVerilog bench with Icarus Verilog."""

import argparse
from pathlib import Path
import shutil
import subprocess
import tempfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--waves", action="store_true", help="keep VCDs in systemverilog/waves/")
    args = parser.parse_args()
    for tool in ("iverilog", "vvp"):
        if shutil.which(tool) is None:
            parser.error(f"{tool} must be on PATH")

    root = Path(__file__).resolve().parent
    sources = sorted(root.glob("*.sv"))
    benches = [p for p in sources if p.stem.endswith(("_test", "_tb"))]
    rtl = [str(p) for p in sources if p not in benches]
    if not benches:
        raise SystemExit("No testbenches found")

    passed = 0
    smoke = 0
    with tempfile.TemporaryDirectory(prefix="building-blocks-sv-") as temp:
        output = Path(temp)
        run_dir = root / "waves" if args.waves else output
        run_dir.mkdir(exist_ok=True)
        for bench in benches:
            binary = output / (bench.stem + ".vvp")
            commands = [
                ["iverilog", "-g2012", "-Wall", "-s", bench.stem,
                 "-o", str(binary), *rtl, str(bench)],
                ["vvp", str(binary), *(["+waves"] if args.waves else [])],
            ]
            result = None
            for command in commands:
                try:
                    result = subprocess.run(command, cwd=run_dir, capture_output=True,
                                            text=True, timeout=60, check=True)
                except subprocess.TimeoutExpired:
                    raise SystemExit(f"FAIL: {bench.name} exceeded 60 seconds")
                except subprocess.CalledProcessError as error:
                    print(error.stdout, end="")
                    print(error.stderr, end="")
                    raise SystemExit(f"FAIL: {bench.name}")
                if result.stderr:
                    print(result.stderr, end="")

            expected = "SMOKE:" if bench.stem == "divider_test" else "PASS:"
            lines = result.stdout.splitlines()
            summary = next((line for line in lines if line.startswith(expected)), None)
            if summary is None:
                print(result.stdout)
                raise SystemExit(f"FAIL: {bench.name} did not pass")
            print(summary)
            if expected == "PASS:":
                passed += 1
            else:
                smoke += 1

    print(f"\n{passed} benches passed, {smoke} divider smoke test ran.")


if __name__ == "__main__":
    main()
