local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node

return {
  -- Fast IO template
  s("fastio", {
    t({
      "#include <iostream>",
      "#include <vector>",
      "#include <algorithm>",
      "#include <string>",
      "#include <map>",
      "#include <set>",
      "#include <queue>",
      "#include <stack>",
      "#include <cmath>",
      "#include <climits>",
      "",
      "using namespace std;",
      "",
      "int main() {",
      "    ios_base::sync_with_stdio(false);",
      "    cin.tie(NULL);",
      "    ",
    }),
    i(1, "// Your code here"),
    t({
      "",
      "    return 0;",
      "}"
    })
  }),

  -- Priority Queue (Max Heap)
  s("pqmax", {
    t("priority_queue<"),
    i(1, "int"),
    t("> "),
    i(2, "pq"),
    t(";")
  }),

  -- Priority Queue (Min Heap)
  s("pqmin", {
    t("priority_queue<"),
    i(1, "int"),
    t(", vector<"),
    f(function(args) return args[1][1] end, {1}),
    t(">, greater<"),
    f(function(args) return args[1][1] end, {1}),
    t(">> "),
    i(2, "pq"),
    t(";")
  }),

  -- Vector declaration
  s("vec", {
    t("vector<"),
    i(1, "int"),
    t("> "),
    i(2, "v"),
    t(";")
  }),

  -- Vector with size
  s("vecn", {
    t("vector<"),
    i(1, "int"),
    t("> "),
    i(2, "v"),
    t("("),
    i(3, "n"),
    t(");")
  }),

  -- Map declaration
  s("map", {
    t("map<"),
    i(1, "int"),
    t(", "),
    i(2, "int"),
    t("> "),
    i(3, "mp"),
    t(";")
  }),

  -- Set declaration
  s("set", {
    t("set<"),
    i(1, "int"),
    t("> "),
    i(2, "st"),
    t(";")
  }),

  -- Unordered map
  s("umap", {
    t("unordered_map<"),
    i(1, "int"),
    t(", "),
    i(2, "int"),
    t("> "),
    i(3, "ump"),
    t(";")
  }),

  -- Unordered set
  s("uset", {
    t("unordered_set<"),
    i(1, "int"),
    t("> "),
    i(2, "ust"),
    t(";")
  }),

  -- For loop
  s("fori", {
    t("for (int "),
    i(1, "i"),
    t(" = "),
    i(2, "0"),
    t("; "),
    f(function(args) return args[1][1] end, {1}),
    t(" < "),
    i(3, "n"),
    t("; "),
    f(function(args) return args[1][1] end, {1}),
    t("++) {"),
    t({"", "    "}),
    i(4),
    t({"", "}"})
  }),

  -- Range-based for loop
  s("forr", {
    t("for (auto "),
    i(1, "x"),
    t(" : "),
    i(2, "container"),
    t(") {"),
    t({"", "    "}),
    i(3),
    t({"", "}"})
  }),

  -- While loop
  s("while", {
    t("while ("),
    i(1, "condition"),
    t(") {"),
    t({"", "    "}),
    i(2),
    t({"", "}"})
  }),

  -- Binary search template
  s("binsearch", {
    t({
      "int left = 0, right = n - 1;",
      "while (left <= right) {",
      "    int mid = left + (right - left) / 2;",
      "    if (arr[mid] == target) {",
      "        return mid;",
      "    } else if (arr[mid] < target) {",
      "        left = mid + 1;",
      "    } else {",
      "        right = mid - 1;",
      "    }",
      "}"
    })
  }),

  -- GCD function
  s("gcd", {
    t({
      "int gcd(int a, int b) {",
      "    return b == 0 ? a : gcd(b, a % b);",
      "}"
    })
  }),

  -- LCM function
  s("lcm", {
    t({
      "int lcm(int a, int b) {",
      "    return (a * b) / gcd(a, b);",
      "}"
    })
  }),

  -- Power function with modulo
  s("powmod", {
    t({
      "long long power(long long base, long long exp, long long mod) {",
      "    long long result = 1;",
      "    while (exp > 0) {",
      "        if (exp % 2 == 1) {",
      "            result = (result * base) % mod;",
      "        }",
      "        base = (base * base) % mod;",
      "        exp /= 2;",
      "    }",
      "    return result;",
      "}"
    })
  }),

  -- Debug macro
  s("debug", {
    t("#define debug(x) cout << #x << \" = \" << x << endl;")
  }),

  -- Common constants
  s("const", {
    t({
      "const int MOD = 1e9 + 7;",
      "const int INF = 1e9;",
      "const long long LLINF = 1e18;"
    })
  }),
}
