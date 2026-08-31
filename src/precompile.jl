using PrecompileTools: @setup_workload, @compile_workload

@setup_workload begin
    @compile_workload begin
        n_cache_lines()

        state = State("hi")
        string(state)

        _patch_with_terminal("let txt = ")
        _replace_code_tabs("")
        _add_documenter_css("")
    end
end
